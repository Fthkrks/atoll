import 'dart:async';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:llamadart/llamadart.dart';
import 'package:path_provider/path_provider.dart';
import '../../l10n/app_localizations.dart';
import '../settings/settings_manager.dart';
import '../translation/i_translator.dart';
import '../translation/llamadart_translator.dart';
import '../translation/translation_service.dart';

enum ModelStatus {
  notDownloaded,
  downloading,
  verifying,
  loading,
  ready,
  error,
}

enum ModelMsg {
  notInstalled,
  notDownloadedYet,
  fileNotFound,
  loading,
  ready,
  loadError,
  pickError,
  downloadStarting,
  downloadCancelledKept,
  downloading,
  verifying,
  downloadCompleteLoading,
  downloadCancelled,
  downloadError,
  downloadErrorNetwork,
  downloadErrorServer,
  downloadErrorVerification,
  downloadErrorGeneric,
  cancelling,
}

/// Status line identified by [kind] (+ optional [arg]); localized by the UI.
class ModelMessage {
  final ModelMsg kind;
  final String arg;
  const ModelMessage(this.kind, [this.arg = '']);
}

class ModelDownloadProgress {
  final int downloadedBytes;
  final int totalBytes;
  final double fraction;
  final double speedMbPerSec;
  final String statusText;

  const ModelDownloadProgress({
    required this.downloadedBytes,
    required this.totalBytes,
    required this.fraction,
    required this.speedMbPerSec,
    required this.statusText,
  });
}

class ModelManager with ChangeNotifier {
  static const String modelUrl =
      'https://registry.ollama.ai/v2/maternion/hy-mt2/blobs/sha256:dc5f44fcf1fa496ee7ad725982c0c8c553a4de00259b53af84c4b89fb0c06699';
  static const String expectedSha256 =
      'dc5f44fcf1fa496ee7ad725982c0c8c553a4de00259b53af84c4b89fb0c06699';
  static const int expectedSize = 1133080448; // 1,133,080,448 bytes

  final SettingsManager settingsManager;

  ModelStatus _status = ModelStatus.notDownloaded;
  ModelMessage _message = const ModelMessage(ModelMsg.notInstalled);
  ModelDownloadProgress? _downloadProgress;
  bool _isInitializing = false;

  LlamaEngine? _engine;
  TranslationService? _translationService;

  int _nextAttemptId = 0;
  _DownloadAttempt? _currentAttempt;
  Future<void>? _activeAttemptFuture;

  ModelStatus get status => _status;
  ModelMessage get message => _message;
  bool get isInitializing => _isInitializing;

  /// Concise error reason when status is [ModelStatus.error].
  String? get errorReason {
    if (_status != ModelStatus.error) return null;
    switch (_message.kind) {
      case ModelMsg.downloadErrorNetwork:
        return 'network error';
      case ModelMsg.downloadErrorServer:
        return _message.arg.isNotEmpty ? 'server error ${_message.arg}' : 'server error';
      case ModelMsg.downloadErrorVerification:
        return 'verification failed';
      case ModelMsg.downloadErrorGeneric:
        return 'download failed';
      case ModelMsg.loadError:
        return 'load error';
      case ModelMsg.downloadError:
      case ModelMsg.pickError:
      case ModelMsg.fileNotFound:
        return _message.arg.isNotEmpty ? _message.arg : 'error';
      default:
        return 'error';
    }
  }

  /// Localized status line for the UI.
  String statusMessageOf(AppLocalizations l) {
    final arg = _message.arg;
    switch (_message.kind) {
      case ModelMsg.notInstalled:
        return l.modelNotInstalled;
      case ModelMsg.notDownloadedYet:
        return l.modelNotDownloaded;
      case ModelMsg.fileNotFound:
        return l.modelFileNotFound(arg);
      case ModelMsg.loading:
        return l.modelLoading;
      case ModelMsg.ready:
        return l.modelReady;
      case ModelMsg.loadError:
        return l.modelLoadError;
      case ModelMsg.pickError:
        return l.modelPickError(arg);
      case ModelMsg.downloadStarting:
        return l.downloadStarting;
      case ModelMsg.downloadCancelledKept:
        return l.downloadCancelledKept;
      case ModelMsg.downloading:
        return l.downloadingPercent(arg);
      case ModelMsg.verifying:
        return l.verifyingSha;
      case ModelMsg.downloadCompleteLoading:
        return l.downloadCompleteLoading;
      case ModelMsg.downloadCancelled:
        return l.downloadCancelled;
      case ModelMsg.downloadError:
        return l.downloadError(arg);
      case ModelMsg.downloadErrorNetwork:
        return l.downloadErrorNetwork;
      case ModelMsg.downloadErrorServer:
        return l.downloadErrorServer(arg);
      case ModelMsg.downloadErrorVerification:
        return l.downloadErrorVerification;
      case ModelMsg.downloadErrorGeneric:
        return l.downloadErrorGeneric;
      case ModelMsg.cancelling:
        return l.cancellingDownload;
    }
  }
  ModelDownloadProgress? get downloadProgress => _downloadProgress;
  TranslationService? get translationService => _translationService;
  bool get isReady => _status == ModelStatus.ready && _translationService != null;

  http.Client Function()? _clientFactory;
  Future<File> Function()? _defaultModelFileResolver;

  ModelManager(
    this.settingsManager, {
    http.Client Function()? httpClientFactory,
    Future<File> Function()? defaultModelFileResolver,
  })  : _clientFactory = httpClientFactory,
        _defaultModelFileResolver = defaultModelFileResolver;

  @visibleForTesting
  set httpClientFactoryForTesting(http.Client Function()? factory) =>
      _clientFactory = factory;

  @visibleForTesting
  set defaultModelFileResolverForTesting(Future<File> Function()? resolver) =>
      _defaultModelFileResolver = resolver;

  Future<void> initialize() async {
    _isInitializing = true;
    notifyListeners();
    try {
      final savedPath = settingsManager.settings.modelFilePath;
      if (savedPath.isNotEmpty) {
        await loadModelFromFile(savedPath);
      } else {
        // Check default model download path
        final defaultFile = await _getDefaultModelFile();
        if (defaultFile.existsSync() && defaultFile.lengthSync() == expectedSize) {
          await loadModelFromFile(defaultFile.path);
        } else {
          _status = ModelStatus.notDownloaded;
          _message = const ModelMessage(ModelMsg.notDownloadedYet);
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint('ModelManager initialize error: $e');
      _status = ModelStatus.error;
      _message = const ModelMessage(ModelMsg.loadError);
      notifyListeners();
    } finally {
      _isInitializing = false;
      notifyListeners();
    }
  }

  Future<File> _getDefaultModelFile() async {
    if (_defaultModelFileResolver != null) {
      return _defaultModelFileResolver!();
    }
    final appDir = await getApplicationDocumentsDirectory();
    final modelsDir = Directory('${appDir.path}/models');
    if (!modelsDir.existsSync()) {
      modelsDir.createSync(recursive: true);
    }
    return File('${modelsDir.path}/hy-mt2-1.8b-q4_k_m.gguf');
  }

  Future<File> _getPartModelFile() async {
    final target = await _getDefaultModelFile();
    return File('${target.path}.part');
  }

  Future<void> loadModelFromFile(String filePath) async {
    final file = File(filePath);
    if (!file.existsSync()) {
      _status = ModelStatus.error;
      _message = ModelMessage(ModelMsg.fileNotFound, filePath);
      notifyListeners();
      return;
    }

    _status = ModelStatus.loading;
    _message = const ModelMessage(ModelMsg.loading);
    notifyListeners();

    try {
      if (_engine != null) {
        await _engine!.dispose();
        _engine = null;
      }

      final engine = await LlamaEngine.load(
        LlamaModel(ModelSource.path(filePath)),
        params: const ModelParams(contextSize: 4096),
      );

      _engine = engine;
      final translator = LlamadartTranslator(engine);
      _translationService = TranslationService(translator);

      await settingsManager.updateModelPath(filePath);

      _status = ModelStatus.ready;
      _message = const ModelMessage(ModelMsg.ready);
      notifyListeners();
    } catch (e) {
      debugPrint('ModelManager loadModelFromFile error: $e');
      _status = ModelStatus.error;
      _message = const ModelMessage(ModelMsg.loadError);
      notifyListeners();
    }
  }

  Future<void> pickModelFile() async {
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['gguf'],
      );

      if (result != null && result.path != null) {
        final path = result.path!;
        await loadModelFromFile(path);
      }
    } catch (e) {
      debugPrint('ModelManager pickModelFile error: $e');
      _status = ModelStatus.error;
      _message = ModelMessage(ModelMsg.pickError, _sanitizeError(e));
      notifyListeners();
    }
  }

  void _handleCancelled(
    _DownloadAttempt attempt, {
    bool hasKeptData = false,
  }) {
    if (_currentAttempt != attempt) return;
    _status = ModelStatus.notDownloaded;
    _message = ModelMessage(
      hasKeptData ? ModelMsg.downloadCancelledKept : ModelMsg.downloadCancelled,
    );
    notifyListeners();
  }

  Future<void> downloadModel() async {
    if (_status == ModelStatus.downloading ||
        _status == ModelStatus.verifying ||
        _status == ModelStatus.loading ||
        _status == ModelStatus.ready ||
        isReady) {
      return;
    }

    final attempt = _DownloadAttempt(
      id: ++_nextAttemptId,
      client: _clientFactory != null ? _clientFactory!() : http.Client(),
    );
    final previousAttemptFuture = _activeAttemptFuture;
    _currentAttempt = attempt;
    final completer = Completer<void>();
    _activeAttemptFuture = completer.future;

    _status = ModelStatus.downloading;
    _message = const ModelMessage(ModelMsg.downloadStarting);
    _downloadProgress = null;
    notifyListeners();

    try {
      final targetFile = await _getDefaultModelFile();
      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt);
        return;
      }
      if (targetFile.existsSync() && targetFile.lengthSync() == expectedSize) {
        if (_currentAttempt != attempt) return;
        await loadModelFromFile(targetFile.path);
        return;
      }

      final partFile = await _getPartModelFile();
      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt);
        return;
      }

      // Ensure previous attempt has completely finished and released the .part file
      if (previousAttemptFuture != null) {
        try {
          await previousAttemptFuture;
        } catch (_) {}
        if (_currentAttempt != attempt) return;
        if (attempt.isCancelled) {
          _handleCancelled(attempt);
          return;
        }
      }

      int existingBytes = 0;
      if (partFile.existsSync()) {
        existingBytes = partFile.lengthSync();
        if (existingBytes > expectedSize) {
          partFile.deleteSync();
          existingBytes = 0;
        }
      }

      final request = http.Request('GET', Uri.parse(modelUrl));
      if (existingBytes > 0) {
        request.headers['Range'] = 'bytes=$existingBytes-';
      }

      final response = await attempt.client.send(request);
      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt);
        return;
      }

      if (response.statusCode != 200 && response.statusCode != 206) {
        throw HttpException('Server response code: ${response.statusCode}');
      }

      final isResume = response.statusCode == 206;
      final totalLength = isResume
          ? (response.contentLength ?? 0) + existingBytes
          : (response.contentLength ?? expectedSize);

      RandomAccessFile? sink;
      try {
        sink = partFile.openSync(
          mode: isResume ? FileMode.append : FileMode.write,
        );

        int downloaded = isResume ? existingBytes : 0;
        final stopwatch = Stopwatch()..start();
        int lastDownloaded = downloaded;
        int lastTimestamp = stopwatch.elapsedMilliseconds;
        double currentSpeed = 0.0;

        await for (final chunk in response.stream) {
          if (_currentAttempt != attempt) {
            return;
          }
          if (attempt.isCancelled) {
            _handleCancelled(attempt, hasKeptData: downloaded > 0);
            return;
          }

          sink.writeFromSync(chunk);
          downloaded += chunk.length;

          final now = stopwatch.elapsedMilliseconds;
          if (now - lastTimestamp >= 500) {
            final deltaBytes = downloaded - lastDownloaded;
            final deltaTimeSec = (now - lastTimestamp) / 1000.0;
            currentSpeed = (deltaBytes / (1024 * 1024)) / deltaTimeSec;

            lastDownloaded = downloaded;
            lastTimestamp = now;

            final fraction = totalLength > 0 ? downloaded / totalLength : 0.0;
            final downloadedMb = (downloaded / (1024 * 1024)).toStringAsFixed(1);
            final totalMb = (totalLength / (1024 * 1024)).toStringAsFixed(1);
            final speedStr = currentSpeed.toStringAsFixed(1);

            _downloadProgress = ModelDownloadProgress(
              downloadedBytes: downloaded,
              totalBytes: totalLength,
              fraction: fraction,
              speedMbPerSec: currentSpeed,
              statusText: '$downloadedMb / $totalMb MB ($speedStr MB/s)',
            );

            _message = ModelMessage(
              ModelMsg.downloading,
              (fraction * 100).toStringAsFixed(1),
            );
            notifyListeners();
          }
        }
      } finally {
        try {
          sink?.closeSync();
        } catch (_) {}
      }

      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt, hasKeptData: true);
        return;
      }

      // Checksum verification
      _status = ModelStatus.verifying;
      _message = const ModelMessage(ModelMsg.verifying);
      notifyListeners();

      final actualSha256 = await _calculateSha256(partFile);
      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt);
        return;
      }
      if (actualSha256.toLowerCase() != expectedSha256.toLowerCase()) {
        partFile.deleteSync();
        throw Exception(
          'SHA256 mismatch!\nExpected: $expectedSha256\nActual: $actualSha256',
        );
      }

      // Rename .part to .gguf
      if (targetFile.existsSync()) {
        targetFile.deleteSync();
      }
      partFile.renameSync(targetFile.path);

      if (_currentAttempt != attempt) return;
      if (attempt.isCancelled) {
        _handleCancelled(attempt);
        return;
      }

      _status = ModelStatus.notDownloaded;
      _message = const ModelMessage(ModelMsg.downloadCompleteLoading);
      notifyListeners();

      await loadModelFromFile(targetFile.path);
    } catch (e) {
      debugPrint('ModelManager download error: $e');
      if (_currentAttempt != attempt) {
        return;
      }
      if (attempt.isCancelled) {
        _status = ModelStatus.notDownloaded;
        _message = const ModelMessage(ModelMsg.downloadCancelled);
      } else {
        _status = ModelStatus.error;
        _message = _classifyDownloadError(e);
      }
      notifyListeners();
    } finally {
      attempt.client.close();
      if (!completer.isCompleted) {
        completer.complete();
      }
      if (_currentAttempt == attempt) {
        _currentAttempt = null;
        _activeAttemptFuture = null;
      }
    }
  }

  void cancelDownload() {
    final attempt = _currentAttempt;
    if (attempt == null || attempt.isCancelled) {
      return;
    }
    attempt.cancel();
    _status = ModelStatus.notDownloaded;
    _message = const ModelMessage(ModelMsg.cancelling);
    notifyListeners();
  }

  Future<String> _calculateSha256(File file) async {
    final reader = file.openRead();
    final digest = await sha256.bind(reader).first;
    return digest.toString();
  }

  ModelMessage _classifyDownloadError(Object e) {
    if (e is FormatException && e.message.contains('SHA256 mismatch')) {
      return const ModelMessage(ModelMsg.downloadErrorVerification);
    }
    final errorStr = e.toString();
    if (errorStr.contains('SHA256 mismatch') ||
        errorStr.contains('verification failed') ||
        errorStr.contains('Verification failed')) {
      return const ModelMessage(ModelMsg.downloadErrorVerification);
    }

    if (e is HttpException) {
      final match = RegExp(r'(\d{3})').firstMatch(e.message);
      final code = match != null ? match.group(1)! : '';
      return ModelMessage(ModelMsg.downloadErrorServer, code);
    }
    if (errorStr.contains('Server response code:') || errorStr.contains('status code:')) {
      final match = RegExp(r'(\d{3})').firstMatch(errorStr);
      final code = match != null ? match.group(1)! : '';
      return ModelMessage(ModelMsg.downloadErrorServer, code);
    }

    if (e is SocketException ||
        e is http.ClientException ||
        e is TimeoutException ||
        errorStr.contains('ClientException') ||
        errorStr.contains('SocketException') ||
        errorStr.contains('TimeoutException') ||
        errorStr.contains('Connection closed') ||
        errorStr.contains('Failed host lookup') ||
        errorStr.contains('Connection refused') ||
        errorStr.contains('Network is unreachable') ||
        errorStr.contains('HandshakeException')) {
      return const ModelMessage(ModelMsg.downloadErrorNetwork);
    }

    return const ModelMessage(ModelMsg.downloadErrorGeneric);
  }

  static String _sanitizeError(Object e) {
    String msg = e.toString().trim();
    if (msg.startsWith('Exception: ')) {
      msg = msg.substring(11).trim();
    }
    msg = msg.replaceAll(RegExp(r'https?://\S+'), '').trim();
    final firstLine = msg
        .split('\n')
        .map((l) => l.trim())
        .firstWhere((l) => l.isNotEmpty, orElse: () => msg);
    if (firstLine.length > 80) {
      return '${firstLine.substring(0, 77)}...';
    }
    return firstLine;
  }

  @visibleForTesting
  void setStatusForTesting({
    required ModelStatus status,
    ModelMessage message = const ModelMessage(ModelMsg.notInstalled),
    ModelDownloadProgress? progress,
    bool isReady = false,
    TranslationService? service,
    bool isInitializing = false,
  }) {
    _status = status;
    if (message.kind == ModelMsg.notInstalled) {
      if (status == ModelStatus.ready) {
        _message = const ModelMessage(ModelMsg.ready);
      } else if (status == ModelStatus.loading) {
        _message = const ModelMessage(ModelMsg.loading);
      } else if (status == ModelStatus.verifying) {
        _message = const ModelMessage(ModelMsg.verifying);
      } else {
        _message = message;
      }
    } else {
      _message = message;
    }
    _downloadProgress = progress;
    _isInitializing = isInitializing;
    if (isReady && _translationService == null) {
      _translationService = service ?? TranslationService(const _FakeTranslator());
    } else if (!isReady) {
      _translationService = null;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _currentAttempt?.cancel();
    _currentAttempt = null;
    _engine?.dispose();
    super.dispose();
  }
}

class _DownloadAttempt {
  final int id;
  final http.Client client;
  final Completer<void> completer = Completer<void>();
  bool isCancelled = false;

  _DownloadAttempt({
    required this.id,
    required this.client,
  });

  void cancel() {
    isCancelled = true;
    client.close();
  }
}

class _FakeTranslator implements ITranslator {
  const _FakeTranslator();

  @override
  Future<String> translate(
    String text,
    String targetLang, {
    String? sourceLang,
  }) async => text;

  @override
  Stream<String> translateStream(
    String text,
    String targetLang, {
    String? sourceLang,
  }) => Stream.value(text);
}

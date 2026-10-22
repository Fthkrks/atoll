import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import '../translation/translation_service.dart';
import 'i_document_translator.dart';
import 'translate_options.dart';
import 'translation_progress.dart';

enum _DetectedEncoding {
  utf8NoBom,
  utf8Bom,
  utf16Le,
  utf16Be,
}

class TxtDocumentTranslator implements IDocumentTranslator {
  final TranslationService translationService;

  @override
  List<String> get extensions => const ['.txt'];

  TxtDocumentTranslator(this.translationService);

  @override
  Future<void> translate({
    required String inputPath,
    required String outputPath,
    required TranslateOptions options,
    void Function(TranslationProgress)? onProgress,
    bool Function()? isCancelled,
  }) async {
    final bytes = await File(inputPath).readAsBytes();
    final (encoding, lineEnding, content) = _decodeBytesAndDetectLineEnding(bytes);

    final lines = content.split(RegExp(r'\r\n|\r|\n'));
    final outputLines = <String>[];

    final total = lines.length;
    int done = 0;

    int i = 0;
    while (i < lines.length) {
      if (isCancelled?.call() == true) {
        throw const FormatException('Translation cancelled');
      }

      if (lines[i].trim().isEmpty) {
        outputLines.add(lines[i]);
        i++;
        done++;
        onProgress?.call(TranslationProgress(done, total, 'Line $done/$total'));
        continue;
      }

      final pStart = i;
      final pLines = <String>[];
      while (i < lines.length && lines[i].trim().isNotEmpty) {
        pLines.add(lines[i]);
        i++;
      }

      final paragraphText = pLines.join(lineEnding);
      final translated = await translationService.translateText(
        paragraphText,
        options.targetLang,
        sourceLang: options.sourceLang,
      );

      outputLines.add(translated);
      done += (i - pStart);
      onProgress?.call(TranslationProgress(done, total, 'Line $done/$total'));
    }

    final resultText = outputLines.join(lineEnding);
    final outputBytes = _encodeString(resultText, encoding);
    await File(outputPath).writeAsBytes(outputBytes);
  }

  static (_DetectedEncoding, String, String) _decodeBytesAndDetectLineEnding(
    Uint8List bytes,
  ) {
    _DetectedEncoding encoding = _DetectedEncoding.utf8NoBom;
    String content;

    if (bytes.length >= 3 &&
        bytes[0] == 0xEF &&
        bytes[1] == 0xBB &&
        bytes[2] == 0xBF) {
      encoding = _DetectedEncoding.utf8Bom;
      content = utf8.decode(bytes.sublist(3), allowMalformed: true);
    } else if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xFE) {
      encoding = _DetectedEncoding.utf16Le;
      content = _decodeUtf16Le(bytes.sublist(2));
    } else if (bytes.length >= 2 && bytes[0] == 0xFE && bytes[1] == 0xFF) {
      encoding = _DetectedEncoding.utf16Be;
      content = _decodeUtf16Be(bytes.sublist(2));
    } else {
      encoding = _DetectedEncoding.utf8NoBom;
      content = utf8.decode(bytes, allowMalformed: true);
    }

    final lineEnding = content.contains('\r\n') ? '\r\n' : '\n';
    return (encoding, lineEnding, content);
  }

  static Uint8List _encodeString(String text, _DetectedEncoding encoding) {
    switch (encoding) {
      case _DetectedEncoding.utf8Bom:
        final body = utf8.encode(text);
        final result = Uint8List(3 + body.length);
        result[0] = 0xEF;
        result[1] = 0xBB;
        result[2] = 0xBF;
        result.setRange(3, 3 + body.length, body);
        return result;

      case _DetectedEncoding.utf16Le:
        final codeUnits = text.codeUnits;
        final result = Uint8List(2 + codeUnits.length * 2);
        result[0] = 0xFF;
        result[1] = 0xFE;
        int offset = 2;
        for (final unit in codeUnits) {
          result[offset++] = unit & 0xFF;
          result[offset++] = (unit >> 8) & 0xFF;
        }
        return result;

      case _DetectedEncoding.utf16Be:
        final codeUnits = text.codeUnits;
        final result = Uint8List(2 + codeUnits.length * 2);
        result[0] = 0xFE;
        result[1] = 0xFF;
        int offset = 2;
        for (final unit in codeUnits) {
          result[offset++] = (unit >> 8) & 0xFF;
          result[offset++] = unit & 0xFF;
        }
        return result;

      case _DetectedEncoding.utf8NoBom:
        return Uint8List.fromList(utf8.encode(text));
    }
  }

  static String _decodeUtf16Le(Uint8List bytes) {
    final codeUnits = <int>[];
    for (int i = 0; i < bytes.length - 1; i += 2) {
      codeUnits.add(bytes[i] | (bytes[i + 1] << 8));
    }
    return String.fromCharCodes(codeUnits);
  }

  static String _decodeUtf16Be(Uint8List bytes) {
    final codeUnits = <int>[];
    for (int i = 0; i < bytes.length - 1; i += 2) {
      codeUnits.add((bytes[i] << 8) | bytes[i + 1]);
    }
    return String.fromCharCodes(codeUnits);
  }
}

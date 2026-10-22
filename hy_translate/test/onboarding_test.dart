import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:hy_translate/core/model/model_manager.dart';
import 'package:hy_translate/core/settings/settings_manager.dart';
import 'package:hy_translate/l10n/app_localizations.dart';
import 'package:hy_translate/l10n/l10n_support.dart';
import 'package:hy_translate/ui/screens/app_gate.dart';
import 'package:hy_translate/ui/screens/onboarding_screen.dart';
import 'package:hy_translate/ui/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _buildTestApp({
  required SettingsManager settingsManager,
  required ModelManager modelManager,
  bool Function()? hasConfiguredModelOverride,
}) {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    locale: const Locale('en'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: appLocalizationsDelegates,
    home: AppGate(
      settingsManager: settingsManager,
      modelManager: modelManager,
      hasConfiguredModelOverride: hasConfiguredModelOverride,
    ),
  );
}

void main() {
  late SettingsManager settingsManager;
  late ModelManager modelManager;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    settingsManager = SettingsManager();
    await settingsManager.load();
    modelManager = ModelManager(settingsManager);
  });

  testWidgets('Not ready: onboarding screen is shown with download button',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.notDownloaded,
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    // Headline
    expect(find.text('Translate without internet'), findsOneWidget);

    // Benefits
    expect(find.text('Works fully offline after setup'), findsOneWidget);
    expect(find.text('Private, nothing leaves your device'), findsOneWidget);
    expect(find.text('Translate text and documents'), findsOneWidget);

    // Size note computed dynamically from ModelManager.expectedSize
    final expectedGb = OnboardingScreen.formatExpectedSize();
    expect(
      find.textContaining('about $expectedGb GB. Wi-Fi recommended.'),
      findsOneWidget,
    );

    // Primary action
    expect(find.text('Download model'), findsOneWidget);

    // Secondary action
    expect(find.text('I already have a .gguf file'), findsOneWidget);

    // Should NOT show HomeScreen tabs
    expect(find.text('Documents'), findsNothing);
  });

  testWidgets('Downloading: progress and Cancel button are shown',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.downloading,
      isReady: false,
      progress: const ModelDownloadProgress(
        downloadedBytes: 120 * 1024 * 1024,
        totalBytes: 1080 * 1024 * 1024,
        fraction: 0.111,
        speedMbPerSec: 5.2,
        statusText: '120.0 / 1080.0 MB (5.2 MB/s)',
      ),
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    // Progress bar
    expect(find.byType(LinearProgressIndicator), findsOneWidget);

    // Progress status text and percentage
    expect(find.text('120.0 / 1080.0 MB (5.2 MB/s)'), findsOneWidget);
    expect(find.text('11.1%'), findsOneWidget);

    // Background note
    expect(
      find.text(
        'You can leave the app; download will resume where you left off.',
      ),
      findsOneWidget,
    );

    // Cancel button
    expect(find.text('Cancel download'), findsOneWidget);
  });

  testWidgets('Verifying: indeterminate progress and verifying message are shown',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.verifying,
      message: const ModelMessage(ModelMsg.verifying),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Verifying SHA256...'), findsOneWidget);
  });

  testWidgets('Error: error message and Try again button are shown',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.error,
      message: const ModelMessage(ModelMsg.downloadError, 'Connection timed out'),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Download error: Connection timed out'),
      findsOneWidget,
    );
    expect(find.text('Try again'), findsOneWidget);
    expect(find.text('I already have a .gguf file'), findsOneWidget);
  });

  testWidgets('Ready: HomeScreen is shown directly by AppGate',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    // HomeScreen elements
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Translate without internet'), findsNothing);
  });

  testWidgets('Switching from downloading to ready fades to HomeScreen',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.downloading,
      isReady: false,
      progress: const ModelDownloadProgress(
        downloadedBytes: 1080 * 1024 * 1024,
        totalBytes: 1080 * 1024 * 1024,
        fraction: 1.0,
        speedMbPerSec: 0.0,
        statusText: '1080.0 / 1080.0 MB (0.0 MB/s)',
      ),
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Cancel download'), findsOneWidget);
    expect(find.text('Documents'), findsNothing);

    // Now model becomes ready
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );
    await tester.pumpAndSettle();

    // Now HomeScreen is shown
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Cancel download'), findsNothing);
  });

  testWidgets('Configured model does not flash onboarding during load',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      message: const ModelMessage(ModelMsg.loading),
      isReady: false,
    );

    // Simulate model is configured on disk
    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // HomeScreen is shown directly without flashing onboarding
    expect(find.text('Text'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Translate without internet'), findsNothing);
  });

  testWidgets(
      'Saved model that fails to load (ModelStatus.error) transitions to OnboardingScreen',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.error,
      message: const ModelMessage(ModelMsg.loadError),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // Must NOT stay on Home
    expect(find.text('Documents'), findsNothing);

    // Must show OnboardingScreen with localized error, Try again, and file picker
    expect(find.text('Translate without internet'), findsOneWidget);
    expect(
      find.text(
        'The model file could not be loaded. It may be damaged. Download it again or pick another file.',
      ),
      findsOneWidget,
    );
    expect(find.text('Try again'), findsOneWidget);
    expect(find.text('I already have a .gguf file'), findsOneWidget);
  });

  testWidgets(
      'Saved model load error in Turkish shows fully localized message without technical details',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.error,
      message: const ModelMessage(ModelMsg.loadError),
      isReady: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        locale: const Locale('tr'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: appLocalizationsDelegates,
        home: AppGate(
          settingsManager: settingsManager,
          modelManager: modelManager,
          hasConfiguredModelOverride: () => true,
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text(
        'Model dosyası yüklenemedi. Bozulmuş olabilir. Yeniden indirin veya başka bir dosya seçin.',
      ),
      findsOneWidget,
    );
    expect(find.text('Tekrar dene'), findsOneWidget);
    expect(find.text('Zaten bir .gguf dosyam var'), findsOneWidget);
    expect(find.textContaining('LlamaException'), findsNothing);
    expect(find.textContaining('/data/user/'), findsNothing);
  });

  testWidgets(
      'Text tab loading banner disappears automatically when model becomes ready',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      message: const ModelMessage(ModelMsg.loading),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // Loading banner is visible initially
    expect(find.text('Loading model into memory...'), findsOneWidget);

    // Model becomes ready without user input
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );
    await tester.pumpAndSettle();

    // Loading banner disappears automatically
    expect(find.text('Loading model into memory...'), findsNothing);
  });

  testWidgets(
      'Network download error shows short localized message and concise errorReason',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.error,
      message: const ModelMessage(ModelMsg.downloadErrorNetwork),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.text('Network error. Please check your connection.'),
      findsOneWidget,
    );
    expect(modelManager.errorReason, 'network error');
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets(
      'Document tab loading banner disappears automatically when model becomes ready',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      message: const ModelMessage(ModelMsg.loading),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // Switch to Documents tab
    await tester.tap(find.text('Documents'));
    await tester.pumpAndSettle();

    // Loading banner is visible initially in Document tab
    expect(find.text('Loading model into memory...'), findsOneWidget);

    // Model becomes ready
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );
    await tester.pumpAndSettle();

    // Loading banner disappears automatically
    expect(find.text('Loading model into memory...'), findsNothing);
  });

  testWidgets(
      'Bug 4: Settings screen hides download button when model is ready, loading, or verifying',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // Switch to Settings tab
    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    // Ready status text is shown and download button is NOT shown
    expect(find.text('Model ready (HunYuan MT2 1.8B Offline)'), findsOneWidget);
    expect(find.text('Download model (1.05 GB)'), findsNothing);
    expect(find.text('Choose .gguf from device'), findsOneWidget);

    // Model status changes to loading
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      message: const ModelMessage(ModelMsg.loading),
      isReady: false,
    );
    await tester.pump();

    // Download button must NOT be shown when loading
    expect(find.text('Download model (1.05 GB)'), findsNothing);

    // Model status changes to verifying
    modelManager.setStatusForTesting(
      status: ModelStatus.verifying,
      message: const ModelMessage(ModelMsg.verifying),
      isReady: false,
    );
    await tester.pump();

    // Download button must NOT be shown when verifying
    expect(find.text('Download model (1.05 GB)'), findsNothing);
  });

  testWidgets(
      'Bug 4: Onboarding screen hides download button when loading or verifying',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      message: const ModelMessage(ModelMsg.loading),
      isReady: false,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => false,
      ),
    );
    await tester.pump();

    // Download button is not shown while loading
    expect(find.text('Download model'), findsNothing);

    // Switch to verifying
    modelManager.setStatusForTesting(
      status: ModelStatus.verifying,
      message: const ModelMessage(ModelMsg.verifying),
      isReady: false,
    );
    await tester.pump();

    // Download button is not shown while verifying
    expect(find.text('Download model'), findsNothing);
  });

  test('Bug 4: ModelManager.downloadModel() returns immediately if downloading, verifying, loading, or ready',
      () async {
    // Ready
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );
    await modelManager.downloadModel();
    expect(modelManager.status, ModelStatus.ready);

    // Loading
    modelManager.setStatusForTesting(
      status: ModelStatus.loading,
      isReady: false,
    );
    await modelManager.downloadModel();
    expect(modelManager.status, ModelStatus.loading);

    // Verifying
    modelManager.setStatusForTesting(
      status: ModelStatus.verifying,
      isReady: false,
    );
    await modelManager.downloadModel();
    expect(modelManager.status, ModelStatus.verifying);
  });

  test(
      'Bug 4: Concurrent calls to ModelManager.downloadModel() without awaiting only start one download',
      () async {
    final tempDir = Directory.systemTemp.createTempSync('model_manager_test_');
    addTearDown(() => tempDir.deleteSync(recursive: true));
    final testModelFile = File('${tempDir.path}/test_model.gguf');

    int clientCreationCount = 0;
    final fakeClient = _CountingHttpClient();

    final testManager = ModelManager(
      settingsManager,
      httpClientFactory: () {
        clientCreationCount++;
        return fakeClient;
      },
      defaultModelFileResolver: () async {
        // Delay to simulate disk operations and ensure concurrent calls overlap
        await Future.delayed(const Duration(milliseconds: 20));
        return testModelFile;
      },
    );

    expect(testManager.status, ModelStatus.notDownloaded);

    // Call downloadModel() twice without awaiting either
    final future1 = testManager.downloadModel();
    final future2 = testManager.downloadModel();

    // The downloading state must be claimed synchronously before any await
    expect(testManager.status, ModelStatus.downloading);

    await Future.wait([future1, future2]);

    // Only one download starts: exactly one client created and one request sent
    expect(clientCreationCount, 1);
    expect(fakeClient.sendCount, 1);
  });

  test(
      'Bug 4: cancel followed by immediate retry runs only one active request after old finishes, correct final state, cannot close new client',
      () async {
    final tempDir =
        Directory.systemTemp.createTempSync('model_cancel_retry_test_');
    addTearDown(() => tempDir.deleteSync(recursive: true));
    final testModelFile = File('${tempDir.path}/test_model.gguf');

    final clients = <_ControlledHttpClient>[];

    final testManager = ModelManager(
      settingsManager,
      httpClientFactory: () {
        final client = _ControlledHttpClient(clients.length + 1);
        clients.add(client);
        return client;
      },
      defaultModelFileResolver: () async {
        await Future.delayed(const Duration(milliseconds: 10));
        return testModelFile;
      },
    );

    // 1. Start attempt 1
    final future1 = testManager.downloadModel();
    expect(testManager.status, ModelStatus.downloading);

    // Wait until attempt 1 has initiated its HTTP request
    await clients[0].requestStarted.future;
    expect(clients[0].activeRequests, 1);

    // 2. Cancel attempt 1 while streaming
    testManager.cancelDownload();
    expect(clients[0].isClosed, isTrue);

    // 3. Immediately retry without awaiting future1
    final future2 = testManager.downloadModel();
    expect(testManager.status, ModelStatus.downloading);

    // Verify client 2 was created for attempt 2
    expect(clients.length, 2);
    final client1 = clients[0];
    final client2 = clients[1];

    // Client 1 is closed; Client 2 must NOT be closed!
    expect(client1.isClosed, isTrue);
    expect(client2.isClosed, isFalse);

    // Allow attempt 1 to finish unwinding
    await future1;

    // After attempt 1 finishes:
    // Client 1's finally MUST NOT have closed client 2!
    expect(client2.isClosed, isFalse,
        reason: 'Old attempt must not close the new client');

    // Wait for client 2's request to start
    await client2.requestStarted.future;

    // Only one active request across all clients after the old one finishes
    expect(client1.activeRequests, 0);
    expect(client2.activeRequests, 1);

    // Complete client 2's stream
    client2.completeStream();

    // Await attempt 2 to complete
    await future2;

    // Verify final state: attempt 2 completed verification, status not corrupted by old attempt
    expect(testManager.status, ModelStatus.error);
    expect(testManager.message.kind, ModelMsg.downloadErrorVerification);
    expect(client2.isClosed, isTrue);
  });

  test(
      'Bug 4: cancel before request sent followed by immediate retry completes cleanly without second attempt interference',
      () async {
    final tempDir =
        Directory.systemTemp.createTempSync('model_cancel_early_test_');
    addTearDown(() => tempDir.deleteSync(recursive: true));
    final testModelFile = File('${tempDir.path}/test_model.gguf');

    final clients = <_ControlledHttpClient>[];

    final testManager = ModelManager(
      settingsManager,
      httpClientFactory: () {
        final client = _ControlledHttpClient(clients.length + 1);
        clients.add(client);
        return client;
      },
      defaultModelFileResolver: () async {
        await Future.delayed(const Duration(milliseconds: 20));
        return testModelFile;
      },
    );

    // Start attempt 1 and immediately cancel before resolver completes
    final future1 = testManager.downloadModel();
    testManager.cancelDownload();

    // Immediately retry
    final future2 = testManager.downloadModel();
    expect(testManager.status, ModelStatus.downloading);

    // Await attempt 1
    await future1;

    // Two clients were created (one for attempt 1, one for attempt 2)
    expect(clients.length, 2);
    final client1 = clients[0];
    final client2 = clients[1];

    // Client 1 was closed before sending; Client 2 is active and open
    expect(client1.isClosed, isTrue);
    expect(client1.activeRequests, 0);

    await client2.requestStarted.future;
    expect(client2.activeRequests, 1);
    expect(client2.isClosed, isFalse);

    client2.completeStream();
    await future2;

    expect(testManager.status, ModelStatus.error);
    expect(testManager.message.kind, ModelMsg.downloadErrorVerification);
    expect(client2.isClosed, isTrue);
  });

  testWidgets(
      'Bug 6: Long translated text (30+ lines) is scrollable and reaches above dock',
      (tester) async {
    modelManager.setStatusForTesting(
      status: ModelStatus.ready,
      isReady: true,
    );

    await tester.pumpWidget(
      _buildTestApp(
        settingsManager: settingsManager,
        modelManager: modelManager,
        hasConfiguredModelOverride: () => true,
      ),
    );
    await tester.pumpAndSettle();

    // Generate 35 lines of text
    final lines = List.generate(35, (i) => 'Line ${i + 1}: Atoll offline translation test paragraph content.');
    final longText = lines.join('\n');

    await tester.enterText(find.byType(TextField), longText);
    await tester.pump(const Duration(milliseconds: 700)); // debounce
    await tester.pumpAndSettle();

    // Verify translated text is present in the output card
    final outputLine1 = find.descendant(
      of: find.byType(SelectableText),
      matching: find.textContaining('Line 1:'),
    );
    expect(outputLine1, findsOneWidget);

    // Scroll to the very bottom
    final scrollableFinder = find.byType(SingleChildScrollView).first;
    await tester.drag(scrollableFinder, const Offset(0, -3000));
    await tester.pumpAndSettle();

    // Line 35 is now visible in the output card
    final outputLine35 = find.descendant(
      of: find.byType(SelectableText),
      matching: find.textContaining('Line 35:'),
    );
    expect(outputLine35, findsOneWidget);

    // Verify Line 35 is positioned above the bottom dock
    final line35Bottom = tester.getBottomLeft(outputLine35).dy;
    final screenHeight = tester.view.physicalSize.height / tester.view.devicePixelRatio;
    // The dock + signature occupies ~98dp at the bottom, so line 35 bottom must be above screenHeight - 50
    expect(line35Bottom, lessThan(screenHeight - 50));
  });
}

class _CountingHttpClient extends http.BaseClient {
  int sendCount = 0;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    sendCount++;
    return http.StreamedResponse(
      const Stream.empty(),
      200,
      contentLength: 0,
    );
  }
}

class _ControlledHttpClient extends http.BaseClient {
  final int id;
  bool isClosed = false;
  int activeRequests = 0;
  final Completer<void> requestStarted = Completer<void>();
  final StreamController<List<int>> responseController =
      StreamController<List<int>>();

  _ControlledHttpClient(this.id);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    activeRequests++;
    if (!requestStarted.isCompleted) {
      requestStarted.complete();
    }
    return http.StreamedResponse(
      responseController.stream,
      200,
      contentLength: 0,
    );
  }

  void completeStream([List<int> bytes = const []]) {
    activeRequests = 0;
    if (!responseController.isClosed) {
      if (bytes.isNotEmpty) {
        responseController.add(bytes);
      }
      responseController.close();
    }
  }

  @override
  void close() {
    isClosed = true;
    activeRequests = 0;
    if (!responseController.isClosed) {
      responseController.addError(
        http.ClientException('Client closed while reading response'),
      );
      responseController.close();
    }
  }
}

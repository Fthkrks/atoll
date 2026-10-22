import 'dart:async';
import 'translate_options.dart';
import 'translation_progress.dart';

abstract class IDocumentTranslator {
  List<String> get extensions;

  Future<void> translate({
    required String inputPath,
    required String outputPath,
    required TranslateOptions options,
    void Function(TranslationProgress)? onProgress,
    bool Function()? isCancelled,
  });
}

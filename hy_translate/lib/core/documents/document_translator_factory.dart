import 'dart:io';
import 'package:path/path.dart' as p;
import 'i_document_translator.dart';

class DocumentTranslatorFactory {
  final List<IDocumentTranslator> translators;

  DocumentTranslatorFactory(this.translators);

  IDocumentTranslator? getTranslator(String filePath) {
    final ext = p.extension(filePath).toLowerCase();
    if (ext.isEmpty) return null;

    for (final t in translators) {
      if (t.extensions.any((e) => e.toLowerCase() == ext)) {
        return t;
      }
    }
    return null;
  }

  static String getDefaultOutputPath(String inputPath, String targetLang) {
    final dir = p.dirname(inputPath);
    final ext = p.extension(inputPath);
    final nameWithoutExt = p.basenameWithoutExtension(inputPath);
    final targetFile = '$nameWithoutExt.${targetLang.toLowerCase()}$ext';
    return dir.isEmpty || dir == '.' ? targetFile : p.join(dir, targetFile);
  }

  static String makeUniquePath(String filePath) {
    if (!File(filePath).existsSync()) return filePath;

    final dir = p.dirname(filePath);
    final ext = p.extension(filePath);
    final nameWithoutExt = p.basenameWithoutExtension(filePath);

    int counter = 2;
    while (true) {
      final candidateName = '$nameWithoutExt ($counter)$ext';
      final candidate = dir.isEmpty || dir == '.'
          ? candidateName
          : p.join(dir, candidateName);

      if (!File(candidate).existsSync()) {
        return candidate;
      }
      counter++;
    }
  }
}

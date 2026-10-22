import 'package:llamadart/llamadart.dart';
import '../languages/languages.dart';
import 'i_translator.dart';

class LlamadartTranslator implements ITranslator {
  final LlamaEngine engine;

  LlamadartTranslator(this.engine);

  static const List<String> defaultStopSequences = [
    '<｜hy_User｜>',
    '<｜hy_Assistant｜>',
    '<｜hy_begin▁of▁sentence｜>',
    '<｜hy_end▁of▁sentence｜>',
  ];

  static const GenerationParams generationParams = GenerationParams(
    temp: 0.7,
    topP: 0.6,
    topK: 20,
    penalty: 1.05,
    maxTokens: 4096,
    stopSequences: defaultStopSequences,
  );

  String formatPrompt(String text, String targetLang, {String? sourceLang}) {
    final innerPrompt = Languages.buildPrompt(text, targetLang, sourceLang);
    return '<｜hy_begin▁of▁sentence｜><｜hy_User｜>$innerPrompt<｜hy_Assistant｜>';
  }

  @override
  Future<String> translate(
    String text,
    String targetLang, {
    String? sourceLang,
  }) async {
    final prompt = formatPrompt(text, targetLang, sourceLang: sourceLang);
    final sb = StringBuffer();
    await for (final token in engine.generate(prompt, params: generationParams)) {
      sb.write(token);
    }
    return sb.toString();
  }

  @override
  Stream<String> translateStream(
    String text,
    String targetLang, {
    String? sourceLang,
  }) {
    final prompt = formatPrompt(text, targetLang, sourceLang: sourceLang);
    return engine.generate(prompt, params: generationParams);
  }
}

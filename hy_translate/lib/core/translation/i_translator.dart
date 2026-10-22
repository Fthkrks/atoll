abstract class ITranslator {
  Future<String> translate(
    String text,
    String targetLang, {
    String? sourceLang,
  });

  Stream<String> translateStream(
    String text,
    String targetLang, {
    String? sourceLang,
  });
}

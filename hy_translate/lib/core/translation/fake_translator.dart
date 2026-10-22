import 'i_translator.dart';

class FakeTranslator implements ITranslator {
  final String Function(String) _transform;
  int callCount = 0;

  FakeTranslator([String prefix = ''])
      : _transform = ((text) => '$prefix$text');

  FakeTranslator.withHandler(this._transform);

  @override
  Future<String> translate(
    String text,
    String targetLang, {
    String? sourceLang,
  }) async {
    callCount++;
    return _transform(text);
  }

  @override
  Stream<String> translateStream(
    String text,
    String targetLang, {
    String? sourceLang,
  }) async* {
    callCount++;
    final result = _transform(text);
    // Yield in small chunks to simulate streaming
    for (int i = 0; i < result.length; i += 3) {
      final end = (i + 3 < result.length) ? i + 3 : result.length;
      yield result.substring(i, end);
    }
  }
}

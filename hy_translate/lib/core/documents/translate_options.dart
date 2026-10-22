class TranslateOptions {
  final String targetLang;
  final String? sourceLang;
  final bool translateSheetNames;
  final bool useOcr;

  const TranslateOptions({
    this.targetLang = 'tr',
    this.sourceLang,
    this.translateSheetNames = false,
    this.useOcr = true,
  });
}

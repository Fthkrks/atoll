class LanguageItem {
  final String code;
  final String englishName;
  final String chineseName;
  final String turkishName;

  const LanguageItem({
    required this.code,
    required this.englishName,
    required this.chineseName,
    required this.turkishName,
  });

  @override
  String toString() => turkishName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageItem &&
          runtimeType == other.runtimeType &&
          code.toLowerCase() == other.code.toLowerCase();

  @override
  int get hashCode => code.toLowerCase().hashCode;
}

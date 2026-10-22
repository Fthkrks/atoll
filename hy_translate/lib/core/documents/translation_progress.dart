/// What a progress step counts; the UI turns it into a localized message.
enum ProgressKind { line, paragraph, sharedText, page, pageOcr }

class TranslationProgress {
  final int current;
  final int total;
  final String message;
  final String? warning;
  final ProgressKind kind;

  const TranslationProgress(
    this.current,
    this.total,
    this.message, [
    this.warning,
  ]) : kind = ProgressKind.line;

  const TranslationProgress.of(
    this.kind,
    this.current,
    this.total, [
    this.message = '',
    this.warning,
  ]);

  double get fraction => total > 0 ? (current / total).clamp(0.0, 1.0) : 0.0;

  @override
  String toString() => 'TranslationProgress($current/$total: $message)';
}

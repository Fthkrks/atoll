class RichPiece {
  final int templateRunIndex;
  final String text;

  const RichPiece(this.templateRunIndex, this.text);

  @override
  String toString() => 'RichPiece($templateRunIndex, "$text")';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RichPiece &&
          templateRunIndex == other.templateRunIndex &&
          text == other.text;

  @override
  int get hashCode => Object.hash(templateRunIndex, text);
}

class RichResult {
  final List<RichPiece> pieces;
  final bool fellBack;
  final bool reordered;

  const RichResult(
    this.pieces,
    this.fellBack, {
    this.reordered = false,
  });

  @override
  String toString() =>
      'RichResult(pieces: $pieces, fellBack: $fellBack, reordered: $reordered)';
}

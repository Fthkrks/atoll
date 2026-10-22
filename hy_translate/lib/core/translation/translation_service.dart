import 'dart:async';
import '../documents/translation_progress.dart';
import '../languages/languages.dart';
import 'i_translator.dart';

class _AsyncSemaphore {
  final int maxCount;
  int _currentCount;
  final List<Completer<void>> _waiters = [];

  _AsyncSemaphore(this.maxCount) : _currentCount = maxCount;

  Future<void> acquire() {
    if (_currentCount > 0) {
      _currentCount--;
      return Future.value();
    }
    final completer = Completer<void>();
    _waiters.add(completer);
    return completer.future;
  }

  void release() {
    if (_waiters.isNotEmpty) {
      final next = _waiters.removeAt(0);
      next.complete();
    } else {
      _currentCount++;
    }
  }
}

class TranslationService {
  final ITranslator translator;
  final _AsyncSemaphore _semaphore = _AsyncSemaphore(2);
  final Map<String, String> _cache = {};

  static final RegExp emailRegex = RegExp(
    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    caseSensitive: false,
  );
  static final RegExp urlRegex = RegExp(
    r'^(https?://|ftp://|www\.)[^\s/$.?#].[^\s]*$',
    caseSensitive: false,
  );

  int get cacheCount => _cache.length;

  TranslationService(this.translator);

  void clearCache() => _cache.clear();

  static bool shouldSkip(String text) {
    if (text.trim().isEmpty) {
      return true;
    }

    final trimmed = text.trim();

    // Shorter than 2 letters or no letters (covers digits and punctuation only)
    final letterCount = trimmed.runes.where((r) {
      final s = String.fromCharCode(r);
      return RegExp(r'\p{L}', unicode: true).hasMatch(s);
    }).length;

    if (letterCount < 2) {
      return true;
    }

    // URLs
    final lower = trimmed.toLowerCase();
    if (urlRegex.hasMatch(trimmed) ||
        lower.startsWith('http://') ||
        lower.startsWith('https://') ||
        lower.startsWith('ftp://') ||
        lower.startsWith('www.')) {
      return true;
    }

    // Email addresses
    if (emailRegex.hasMatch(trimmed)) {
      return true;
    }

    return false;
  }

  Future<String> translateText(
    String text,
    String targetLang, {
    String? sourceLang,
    void Function(TranslationProgress)? onProgress,
  }) async {
    if (text.isEmpty) return text;

    // Whitespace preservation: isolate leading and trailing whitespace
    int leadingCount = 0;
    while (leadingCount < text.length && _isWhitespace(text[leadingCount])) {
      leadingCount++;
    }

    if (leadingCount == text.length) {
      return text; // entirely whitespace
    }

    int trailingCount = 0;
    while (trailingCount < text.length - leadingCount &&
        _isWhitespace(text[text.length - 1 - trailingCount])) {
      trailingCount++;
    }

    final leading = text.substring(0, leadingCount);
    final trailing = text.substring(text.length - trailingCount);
    final core = text.substring(leadingCount, text.length - trailingCount);

    if (shouldSkip(core)) {
      return text;
    }

    final String translatedCore;
    if (core.length <= 1500) {
      translatedCore = await _translateSegmentCached(core, targetLang, sourceLang);
    } else {
      translatedCore = await _translateLongText(core, targetLang, sourceLang);
    }

    return '$leading$translatedCore$trailing';
  }

  Future<String> translateRaw(
    String text,
    String targetLang, {
    String? sourceLang,
  }) async {
    return await _translateSegmentCached(text, targetLang, sourceLang);
  }

  Future<String> _translateSegmentCached(
    String segment,
    String targetLang,
    String? sourceLang,
  ) async {
    final key = '$segment\u0000$sourceLang\u0000$targetLang';
    if (_cache.containsKey(key)) {
      return _cache[key]!;
    }

    await _semaphore.acquire();
    try {
      if (_cache.containsKey(key)) {
        return _cache[key]!;
      }

      var translated = await translator.translate(
        segment,
        targetLang,
        sourceLang: sourceLang,
      );

      // Safety guard: if output contains instruction echo not in source, retry once
      if (Languages.containsInstructionEcho(translated, segment)) {
        translated = await translator.translate(
          segment,
          targetLang,
          sourceLang: sourceLang,
        );
        if (Languages.containsInstructionEcho(translated, segment)) {
          translated = segment;
        }
      }

      translated = Languages.postProcessTranslation(translated, segment);
      _cache[key] = translated;
      return translated;
    } finally {
      _semaphore.release();
    }
  }

  Future<String> _translateLongText(
    String text,
    String targetLang,
    String? sourceLang,
  ) async {
    // Split by paragraph boundaries, keeping delimiters
    final paragraphParts = _splitWithDelimiters(text, RegExp(r'(\r?\n\s*\r?\n)'));
    final sb = StringBuffer();

    for (int i = 0; i < paragraphParts.length; i++) {
      final part = paragraphParts[i];
      // Even indices are text, odd indices are delimiters
      if (i % 2 == 1) {
        sb.write(part);
        continue;
      }

      if (part.trim().isEmpty) {
        sb.write(part);
        continue;
      }

      if (part.length <= 1500) {
        final translated = await translateText(
          part,
          targetLang,
          sourceLang: sourceLang,
        );
        sb.write(translated);
      } else {
        // Split by sentence boundaries: delimiter (?<=[.!?])\s+
        final sentenceParts = _splitSentences(part);
        final currentChunk = StringBuffer();

        for (final sp in sentenceParts) {
          if (currentChunk.length + sp.length > 1500 && currentChunk.isNotEmpty) {
            final tr = await translateText(
              currentChunk.toString(),
              targetLang,
              sourceLang: sourceLang,
            );
            sb.write(tr);
            currentChunk.clear();
          }
          currentChunk.write(sp);
        }

        if (currentChunk.isNotEmpty) {
          final tr = await translateText(
            currentChunk.toString(),
            targetLang,
            sourceLang: sourceLang,
          );
          sb.write(tr);
        }
      }
    }

    return sb.toString();
  }

  static bool _isWhitespace(String ch) {
    return ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n' || ch == '\u00A0';
  }

  static List<String> _splitWithDelimiters(String input, RegExp delimiter) {
    final result = <String>[];
    int start = 0;
    for (final match in delimiter.allMatches(input)) {
      result.add(input.substring(start, match.start));
      result.add(match.group(0)!);
      start = match.end;
    }
    result.add(input.substring(start));
    return result;
  }

  static List<String> _splitSentences(String input) {
    final result = <String>[];
    final regex = RegExp(r'([.!?]+)(\s+)');
    int start = 0;
    for (final match in regex.allMatches(input)) {
      result.add(input.substring(start, match.end));
      start = match.end;
    }
    if (start < input.length) {
      result.add(input.substring(start));
    }
    return result;
  }
}

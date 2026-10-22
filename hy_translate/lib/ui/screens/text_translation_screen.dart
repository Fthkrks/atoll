import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/dock_metrics.dart';
import 'package:flutter/services.dart';
import '../../core/languages/language_item.dart';
import '../../core/languages/languages.dart';
import '../../core/model/model_manager.dart';
import '../../core/settings/settings_manager.dart';
import '../widgets/language_selector_sheet.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_support.dart';

class TextTranslationScreen extends StatefulWidget {
  final ModelManager modelManager;
  final SettingsManager settingsManager;

  const TextTranslationScreen({
    super.key,
    required this.modelManager,
    required this.settingsManager,
  });

  @override
  State<TextTranslationScreen> createState() => _TextTranslationScreenState();
}

class _TextTranslationScreenState extends State<TextTranslationScreen> {
  final TextEditingController _inputController = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();

  late LanguageItem _sourceLang;
  late LanguageItem _targetLang;

  Timer? _debounceTimer;
  StreamSubscription<String>? _activeStreamSub;

  String _translatedText = '';
  bool _isTranslating = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    widget.modelManager.addListener(_onModelChanged);
    final defaultSource = widget.settingsManager.settings.defaultSourceLang;
    final defaultTarget = widget.settingsManager.settings.defaultTargetLang;

    _sourceLang = Languages.findByCode(defaultSource) ?? Languages.auto;
    _targetLang = Languages.findByCode(defaultTarget) ??
        Languages.findByCode('tr') ??
        Languages.supportedLanguages.first;
  }

  void _onModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.modelManager.removeListener(_onModelChanged);
    _debounceTimer?.cancel();
    _activeStreamSub?.cancel();
    _inputController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  void _onInputChanged(String text) {
    setState(() {}); // updates character count & clear button
    _debounceTimer?.cancel();

    if (text.trim().isEmpty) {
      _cancelTranslation();
      setState(() {
        _translatedText = '';
        _isTranslating = false;
        _errorMessage = null;
      });
      return;
    }

    // 600ms debounce
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      _startTranslation(text);
    });
  }

  void _cancelTranslation() {
    _activeStreamSub?.cancel();
    _activeStreamSub = null;
  }

  Future<void> _startTranslation(String text) async {
    final service = widget.modelManager.translationService;
    if (service == null) {
      setState(() {
        _errorMessage = AppLocalizations.of(context).modelRequired;
      });
      return;
    }

    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    _cancelTranslation();

    setState(() {
      _isTranslating = true;
      _translatedText = '';
      _errorMessage = null;
    });

    final targetCode = _targetLang.code;
    final sourceCode = _sourceLang.code == Languages.autoCode ? null : _sourceLang.code;

    try {
      final stream = service.translator.translateStream(
        trimmed,
        targetCode,
        sourceLang: sourceCode,
      );

      final sb = StringBuffer();
      _activeStreamSub = stream.listen(
        (chunk) {
          sb.write(chunk);
          if (mounted) {
            setState(() {
              _translatedText = sb.toString();
            });
          }
        },
        onError: (e) {
          if (mounted) {
            setState(() {
              _isTranslating = false;
              _errorMessage = AppLocalizations.of(context).translationError('$e');
            });
          }
        },
        onDone: () {
          if (mounted) {
            // Run post-processing
            final postProcessed = Languages.postProcessTranslation(
              sb.toString(),
              trimmed,
            );
            setState(() {
              _translatedText = postProcessed;
              _isTranslating = false;
            });
          }
        },
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTranslating = false;
          _errorMessage = AppLocalizations.of(context).genericError('$e');
        });
      }
    }
  }

  void _swapLanguages() {
    if (_sourceLang.code == Languages.autoCode) return;
    setState(() {
      final temp = _sourceLang;
      _sourceLang = _targetLang;
      _targetLang = temp;

      // Swap texts if translated text exists
      if (_translatedText.isNotEmpty) {
        final newSource = _translatedText;
        _inputController.text = newSource;
        _startTranslation(newSource);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.translate, size: 24),
            const SizedBox(width: 8),
            Text(
              'Atoll',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Model Not Ready Banner
            ListenableBuilder(
              listenable: widget.modelManager,
              builder: (context, _) {
                if (widget.modelManager.isReady) {
                  return const SizedBox.shrink();
                }
                return _buildModelNoticeBanner(theme);
              },
            ),

            // Top Language Selection Bar
            _buildLanguageBar(theme),

            // Main Content Area
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                    16, 16, 16, 16 + DockMetrics.clearance(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Input Card
                    _buildInputCard(theme),

                    const SizedBox(height: 16),

                    // Output Card
                    _buildOutputCard(theme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModelNoticeBanner(ThemeData theme) {
    return Container(
      width: double.infinity,
      color: theme.colorScheme.errorContainer.withAlpha(180),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: theme.colorScheme.error),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.modelManager.statusMessageOf(AppLocalizations.of(context)),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onErrorContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (widget.modelManager.status == ModelStatus.notDownloaded)
            TextButton(
              onPressed: () => widget.modelManager.downloadModel(),
              child: Text(AppLocalizations.of(context).download),
            ),
          if (widget.modelManager.status == ModelStatus.downloading)
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () => widget.modelManager.cancelDownload(),
            ),
        ],
      ),
    );
  }

  Widget _buildLanguageBar(ThemeData theme) {
    final canSwap = _sourceLang.code != Languages.autoCode;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withAlpha(40),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Source Language Button
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                LanguageSelectorSheet.show(
                  context: context,
                  selected: _sourceLang,
                  isSource: true,
                  onSelected: (l) {
                    setState(() => _sourceLang = l);
                    if (_inputController.text.trim().isNotEmpty) {
                      _startTranslation(_inputController.text);
                    }
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        languageName(context, _sourceLang),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: theme.colorScheme.primary),
                  ],
                ),
              ),
            ),
          ),

          // Swap Button
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            color: canSwap
                ? theme.colorScheme.primary
                : theme.disabledColor,
            tooltip: AppLocalizations.of(context).swapLanguages,
            onPressed: canSwap ? _swapLanguages : null,
          ),

          // Target Language Button
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                LanguageSelectorSheet.show(
                  context: context,
                  selected: _targetLang,
                  isSource: false,
                  onSelected: (l) {
                    setState(() => _targetLang = l);
                    if (_inputController.text.trim().isNotEmpty) {
                      _startTranslation(_inputController.text);
                    }
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        languageName(context, _targetLang),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: theme.colorScheme.primary),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard(ThemeData theme) {
    final textLength = _inputController.text.length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  languageName(context, _sourceLang),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_inputController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear, size: 20),
                    tooltip: AppLocalizations.of(context).clear,
                    onPressed: () {
                      _inputController.clear();
                      _onInputChanged('');
                    },
                  ),
              ],
            ),
            TextField(
              controller: _inputController,
              focusNode: _inputFocusNode,
              maxLines: null,
              minLines: 4,
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
              textDirection: _sourceLang.code == Languages.autoCode
                  ? null
                  : (Languages.isRtl(_sourceLang.code)
                      ? TextDirection.rtl
                      : TextDirection.ltr),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).inputHint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: _onInputChanged,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$textLength / 5000',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                FilledButton.icon(
                  onPressed: _inputController.text.trim().isNotEmpty && !_isTranslating
                      ? () => _startTranslation(_inputController.text)
                      : null,
                  icon: _isTranslating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.translate, size: 18),
                  label: Text(AppLocalizations.of(context).translate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutputCard(ThemeData theme) {
    return Card(
      color: theme.brightness == Brightness.light
          ? const Color(0xFFEBF3FE)
          : const Color(0xFF1E2838),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  languageName(context, _targetLang),
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (_translatedText.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.copy, size: 20),
                    tooltip: AppLocalizations.of(context).copyToClipboard,
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _translatedText));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppLocalizations.of(context).translationCopied),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: TextStyle(color: theme.colorScheme.error),
              )
            else if (_isTranslating && _translatedText.isEmpty)
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    AppLocalizations.of(context).translating,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            else if (_translatedText.isNotEmpty)
              SelectableText(
                _translatedText,
                textDirection: Languages.isRtl(_targetLang.code)
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  height: 1.4,
                ),
              )
            else
              Text(
                AppLocalizations.of(context).translationPlaceholder,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant.withAlpha(120),
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/dock_metrics.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as p;
import 'package:share_plus/share_plus.dart';
import '../../core/documents/document_translator_factory.dart';
import '../../core/documents/docx_document_translator.dart';
import '../../core/documents/md_document_translator.dart';
import '../../core/documents/pdf_document_translator.dart';
import '../../core/documents/pptx_document_translator.dart';
import '../../core/documents/translate_options.dart';
import '../../core/documents/translation_progress.dart';
import '../../core/documents/txt_document_translator.dart';
import '../../core/documents/xlsx_document_translator.dart';
import '../../core/languages/language_item.dart';
import '../../core/languages/languages.dart';
import '../../core/model/model_manager.dart';
import '../../core/ocr/mlkit_pdf_ocr.dart';
import '../../core/settings/settings_manager.dart';
import '../widgets/language_selector_sheet.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_support.dart';

class DocumentTranslationScreen extends StatefulWidget {
  final ModelManager modelManager;
  final SettingsManager settingsManager;

  const DocumentTranslationScreen({
    super.key,
    required this.modelManager,
    required this.settingsManager,
  });

  @override
  State<DocumentTranslationScreen> createState() => _DocumentTranslationScreenState();
}

class _DocumentTranslationScreenState extends State<DocumentTranslationScreen> {
  String? _selectedFilePath;
  int? _selectedFileSize;
  String? _outputFilePath;

  late LanguageItem _sourceLang;
  late LanguageItem _targetLang;

  bool _useOcr = true;
  bool _translateSheetNames = false;

  bool _isTranslating = false;
  bool _isCancelled = false;
  TranslationProgress? _currentProgress;
  String? _completionMessage;
  String? _errorMessage;

  DocumentTranslatorFactory? _factory;
  MlKitPdfOcr? _ocr;

  @override
  void initState() {
    super.initState();
    widget.modelManager.addListener(_onModelChanged);
    final s = widget.settingsManager.settings;
    _sourceLang = Languages.findByCode(s.defaultSourceLang) ?? Languages.auto;
    _targetLang = Languages.findByCode(s.defaultTargetLang) ??
        Languages.findByCode('tr') ??
        Languages.supportedLanguages.first;
    _useOcr = s.ocrEnabled;
    _translateSheetNames = s.translateSheetNames;

    _initFactory();
  }

  void _onModelChanged() {
    if (mounted) {
      _initFactory();
      setState(() {});
    }
  }

  void _initFactory() {
    final service = widget.modelManager.translationService;
    if (service != null) {
      _ocr = MlKitPdfOcr();
      final translators = [
        DocxDocumentTranslator(service),
        PptxDocumentTranslator(service),
        XlsxDocumentTranslator(service),
        PdfDocumentTranslator(service, ocr: _ocr),
        TxtDocumentTranslator(service),
        MdDocumentTranslator(service),
      ];
      _factory = DocumentTranslatorFactory(translators);
    }
  }

  @override
  void dispose() {
    widget.modelManager.removeListener(_onModelChanged);
    _ocr?.dispose();
    super.dispose();
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['docx', 'pptx', 'xlsx', 'pdf', 'txt', 'md', 'markdown'],
      );

      if (result != null && result.path != null) {
        final path = result.path!;
        final file = File(path);
        final size = await file.length();

        setState(() {
          _selectedFilePath = path;
          _selectedFileSize = size;
          _completionMessage = null;
          _errorMessage = null;

          final defaultOut = DocumentTranslatorFactory.getDefaultOutputPath(
            path,
            _targetLang.code,
          );
          _outputFilePath = DocumentTranslatorFactory.makeUniquePath(defaultOut);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorMessage = AppLocalizations.of(context).pickFileError('$e'));
      }
    }
  }

  Future<void> _changeSaveLocation() async {
    if (_outputFilePath == null) return;

    final fileName = p.basename(_outputFilePath!);
    final customDir = await FilePicker.getDirectoryPath(
      dialogTitle: AppLocalizations.of(context).chooseSaveFolder,
    );

    if (customDir != null) {
      setState(() {
        _outputFilePath = p.join(customDir, fileName);
      });
    }
  }

  Future<void> _startTranslation() async {
    if (_selectedFilePath == null || _outputFilePath == null) return;

    if (!widget.modelManager.isReady) {
      setState(() {
        _errorMessage = AppLocalizations.of(context).modelRequired;
      });
      return;
    }

    _initFactory();
    final translator = _factory?.getTranslator(_selectedFilePath!);
    if (translator == null) {
      setState(() => _errorMessage = AppLocalizations.of(context).unsupportedFormat);
      return;
    }

    setState(() {
      _isTranslating = true;
      _isCancelled = false;
      _currentProgress = null;
      _completionMessage = null;
      _errorMessage = null;
    });

    final options = TranslateOptions(
      targetLang: _targetLang.code,
      sourceLang: _sourceLang.code == Languages.autoCode ? null : _sourceLang.code,
      translateSheetNames: _translateSheetNames,
      useOcr: _useOcr,
    );

    try {
      await translator.translate(
        inputPath: _selectedFilePath!,
        outputPath: _outputFilePath!,
        options: options,
        onProgress: (prog) {
          if (mounted) setState(() => _currentProgress = prog);
        },
        isCancelled: () => _isCancelled,
      );

      if (mounted) {
        setState(() {
          _isTranslating = false;
          _completionMessage = AppLocalizations.of(context).documentDone;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isTranslating = false;
          if (_isCancelled) {
            _errorMessage = AppLocalizations.of(context).translationCancelled;
          } else {
            _errorMessage = AppLocalizations.of(context).documentError('$e');
          }
        });
      }
    }
  }

  void _cancel() {
    _isCancelled = true;
  }

  void _openFile() {
    if (_outputFilePath != null && File(_outputFilePath!).existsSync()) {
      OpenFilex.open(_outputFilePath!);
    }
  }

  void _shareFile() {
    if (_outputFilePath != null && File(_outputFilePath!).existsSync()) {
      SharePlus.instance.share(ShareParams(files: [XFile(_outputFilePath!)]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ext = _selectedFilePath != null
        ? p.extension(_selectedFilePath!).toLowerCase()
        : '';
    final isPdf = ext == '.pdf';
    final isXlsx = ext == '.xlsx';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).documentTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: widget.modelManager,
              builder: (context, _) {
                if (widget.modelManager.isReady) {
                  return const SizedBox.shrink();
                }
                return _buildModelNoticeBanner(theme);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                    16, 16, 16, 16 + DockMetrics.clearance(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Language Selection Bar
                    _buildLanguageBar(theme),

                    const SizedBox(height: 16),

                    // File Selection Box
                    if (_selectedFilePath == null)
                      _buildPickFileBox(theme)
                    else
                      _buildFileInfoCard(theme, isPdf, isXlsx),

                    const SizedBox(height: 16),

                    // Progress Section
                    if (_isTranslating) _buildProgressCard(theme),

                    // Completion Actions
                    if (_completionMessage != null) _buildSuccessCard(theme),

                    // Error Banner
                    if (_errorMessage != null)
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: theme.colorScheme.onErrorContainer),
                        ),
                      ),
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
    return Container(
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.dividerColor.withAlpha(40)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                LanguageSelectorSheet.show(
                  context: context,
                  selected: _sourceLang,
                  isSource: true,
                  onSelected: (l) => setState(() => _sourceLang = l),
                );
              },
              child: Text(
                languageName(context, _sourceLang),
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Icon(
            Directionality.of(context) == TextDirection.rtl
                ? Icons.arrow_back
                : Icons.arrow_forward,
            size: 20,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                LanguageSelectorSheet.show(
                  context: context,
                  selected: _targetLang,
                  isSource: false,
                  onSelected: (l) {
                    setState(() {
                      _targetLang = l;
                      if (_selectedFilePath != null) {
                        final defaultOut = DocumentTranslatorFactory.getDefaultOutputPath(
                          _selectedFilePath!,
                          _targetLang.code,
                        );
                        _outputFilePath = DocumentTranslatorFactory.makeUniquePath(defaultOut);
                      }
                    });
                  },
                );
              },
              child: Text(
                languageName(context, _targetLang),
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickFileBox(ThemeData theme) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: _pickDocument,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withAlpha(12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withAlpha(80),
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.upload_file,
              size: 54,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).tapToPickDocument,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'DOCX, PPTX, XLSX, PDF, TXT, MD',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileInfoCard(ThemeData theme, bool isPdf, bool isXlsx) {
    final fileName = p.basename(_selectedFilePath!);
    final sizeKb = (_selectedFileSize ?? 0) / 1024.0;
    final sizeText = sizeKb > 1024
        ? '${(sizeKb / 1024.0).toStringAsFixed(1)} MB'
        : '${sizeKb.toStringAsFixed(1)} KB';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildFormatIcon(p.extension(_selectedFilePath!)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fileName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(sizeText, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: _isTranslating
                      ? null
                      : () {
                          setState(() {
                            _selectedFilePath = null;
                            _outputFilePath = null;
                            _completionMessage = null;
                            _errorMessage = null;
                          });
                        },
                ),
              ],
            ),
            const Divider(height: 24),
            Text(
              AppLocalizations.of(context).saveLocation,
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _outputFilePath ?? '',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextButton(
                  onPressed: _isTranslating ? null : _changeSaveLocation,
                  child: Text(AppLocalizations.of(context).change),
                ),
              ],
            ),
            if (isPdf) ...[
              const Divider(height: 16),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(AppLocalizations.of(context).pdfOcrTitle),
                subtitle: Text(AppLocalizations.of(context).pdfOcrSubtitle),
                value: _useOcr,
                onChanged: _isTranslating
                    ? null
                    : (val) => setState(() => _useOcr = val),
              ),
            ],
            if (isXlsx) ...[
              const Divider(height: 16),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(AppLocalizations.of(context).sheetNamesShort),
                value: _translateSheetNames,
                onChanged: _isTranslating
                    ? null
                    : (val) => setState(() => _translateSheetNames = val),
              ),
            ],
            const SizedBox(height: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              onPressed: _isTranslating || !widget.modelManager.isReady
                  ? null
                  : _startTranslation,
              icon: const Icon(Icons.translate),
              label: Text(AppLocalizations.of(context).translateDocument),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatIcon(String ext) {
    Color color = Colors.blue;
    IconData icon = Icons.description;

    switch (ext.toLowerCase()) {
      case '.docx':
        color = Colors.blue.shade700;
        break;
      case '.pptx':
        color = Colors.deepOrange;
        break;
      case '.xlsx':
        color = Colors.green.shade700;
        break;
      case '.pdf':
        color = Colors.red.shade700;
        break;
      case '.md':
      case '.markdown':
        color = Colors.teal;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }

  static String _progressText(AppLocalizations l, TranslationProgress p) {
    switch (p.kind) {
      case ProgressKind.line:
        return l.progressLine(p.current, p.total);
      case ProgressKind.paragraph:
        return l.progressParagraph(p.current, p.total);
      case ProgressKind.sharedText:
        return l.progressSharedText(p.current, p.total);
      case ProgressKind.page:
        return l.progressPage(p.current, p.total);
      case ProgressKind.pageOcr:
        return l.progressPageOcr(p.current, p.total);
    }
  }

  Widget _buildProgressCard(ThemeData theme) {
    final fraction = _currentProgress?.fraction ?? 0.0;
    final l = AppLocalizations.of(context);
    final prog = _currentProgress;
    final message = prog == null ? l.preparing : _progressText(l, prog);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    message,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _cancel,
                  child: Text(AppLocalizations.of(context).cancel),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: fraction > 0 ? fraction : null),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessCard(ThemeData theme) {
    return Card(
      color: theme.colorScheme.primaryContainer.withAlpha(80),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).documentDone,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _openFile,
                    icon: const Icon(Icons.open_in_new),
                    label: Text(AppLocalizations.of(context).openFile),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _shareFile,
                    icon: const Icon(Icons.share),
                    label: Text(AppLocalizations.of(context).share),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

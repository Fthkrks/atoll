import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/dock_metrics.dart';
import '../../core/languages/languages.dart';
import '../../core/model/model_manager.dart';
import '../../core/settings/settings_manager.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_support.dart';
import '../widgets/app_language_sheet.dart';
import '../widgets/language_selector_sheet.dart';

class SettingsScreen extends StatelessWidget {
  final SettingsManager settingsManager;
  final ModelManager modelManager;

  const SettingsScreen({
    super.key,
    required this.settingsManager,
    required this.modelManager,
  });

  static bool _hasValidModelFile(String path) {
    if (path.isEmpty) return false;
    final file = File(path);
    return file.existsSync() && file.lengthSync() == ModelManager.expectedSize;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    final chevron = Directionality.of(context) == TextDirection.rtl
        ? Icons.chevron_left_rounded
        : Icons.chevron_right_rounded;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
        centerTitle: false,
      ),
      body: ListenableBuilder(
        listenable: Listenable.merge([settingsManager, modelManager]),
        builder: (context, _) {
          final settings = settingsManager.settings;
          final modelStatus = modelManager.status;
          final statusMsg = modelManager.statusMessageOf(l10n);
          final progress = modelManager.downloadProgress;

          final sourceLang = Languages.findByCode(settings.defaultSourceLang) ?? Languages.auto;
          final targetLang = Languages.findByCode(settings.defaultTargetLang) ??
              Languages.supportedLanguages.firstWhere((l) => l.code == 'tr');

          return ListView(
            padding: EdgeInsets.fromLTRB(
                16, 12, 16, 12 + DockMetrics.clearance(context)),
            children: [
              // MODEL SECTION
              _buildSectionHeader(context, l10n.aiModel, Icons.memory),
              const SizedBox(height: 8),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: modelManager.isReady
                        ? colorScheme.primary.withValues(alpha: 0.4)
                        : colorScheme.outlineVariant,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            modelManager.isReady
                                ? Icons.check_circle_rounded
                                : modelStatus == ModelStatus.downloading ||
                                        modelStatus == ModelStatus.verifying ||
                                        modelStatus == ModelStatus.loading
                                    ? Icons.sync_rounded
                                    : Icons.info_outline_rounded,
                            color: modelManager.isReady
                                ? Colors.green
                                : colorScheme.primary,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'HunYuan MT2 1.8B Q4_K_M',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  statusMsg,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: modelStatus == ModelStatus.error
                                        ? colorScheme.error
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (settings.modelFilePath.isNotEmpty &&
                          File(settings.modelFilePath).existsSync()) ...[
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            settings.modelFilePath,
                            style: TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 11,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                      if (modelStatus == ModelStatus.downloading &&
                          progress != null) ...[
                        const SizedBox(height: 16),
                        LinearProgressIndicator(
                          value: progress.fraction > 0 ? progress.fraction : null,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              progress.statusText,
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              '${(progress.fraction * 100).toStringAsFixed(1)}%',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (modelStatus == ModelStatus.downloading)
                            FilledButton.tonalIcon(
                              onPressed: () => modelManager.cancelDownload(),
                              icon: const Icon(Icons.cancel_outlined),
                              label: Text(l10n.cancelDownload),
                              style: FilledButton.styleFrom(
                                foregroundColor: colorScheme.error,
                              ),
                            )
                          else if (!modelManager.isReady &&
                              modelStatus != ModelStatus.verifying &&
                              modelStatus != ModelStatus.loading &&
                              modelStatus != ModelStatus.ready &&
                              !modelManager.isInitializing &&
                              !_hasValidModelFile(settings.modelFilePath))
                            FilledButton.icon(
                              onPressed: () => modelManager.downloadModel(),
                              icon: const Icon(Icons.download_rounded),
                              label: Text(l10n.downloadModel),
                            ),
                          OutlinedButton.icon(
                            onPressed: (modelStatus == ModelStatus.downloading ||
                                    modelStatus == ModelStatus.verifying ||
                                    modelStatus == ModelStatus.loading)
                                ? null
                                : () => modelManager.pickModelFile(),
                            icon: const Icon(Icons.folder_open_rounded),
                            label: Text(l10n.pickGguf),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // TRANSLATION DEFAULTS
              _buildSectionHeader(context, l10n.defaultLanguages, Icons.translate_rounded),
              const SizedBox(height: 8),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(l10n.defaultSourceLanguage),
                      subtitle: Text(languageName(context, sourceLang)),
                      leading: const Icon(Icons.input_rounded),
                      trailing: Icon(chevron),
                      onTap: () {
                        LanguageSelectorSheet.show(
                          context: context,
                          selected: sourceLang,
                          isSource: true,
                          onSelected: (item) {
                            settingsManager.updateDefaultLanguages(
                              sourceLang: item.code,
                            );
                          },
                        );
                      },
                    ),
                    const Divider(height: 1, indent: 56),
                    ListTile(
                      title: Text(l10n.defaultTargetLanguage),
                      subtitle: Text(languageName(context, targetLang)),
                      leading: const Icon(Icons.output_rounded),
                      trailing: Icon(chevron),
                      onTap: () {
                        LanguageSelectorSheet.show(
                          context: context,
                          selected: targetLang,
                          isSource: false,
                          onSelected: (item) {
                            settingsManager.updateDefaultLanguages(
                              targetLang: item.code,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // BELGE VE OCR AYARLARI
              _buildSectionHeader(context, l10n.documentsOcr, Icons.description_rounded),
              const SizedBox(height: 8),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    SwitchListTile(
                      title: Text(l10n.pdfOcrSupport),
                      subtitle: Text(l10n.pdfOcrSupportDesc),
                      secondary: const Icon(Icons.document_scanner_rounded),
                      value: settings.ocrEnabled,
                      onChanged: (val) {
                        settingsManager.updateOcrEnabled(val);
                      },
                    ),
                    const Divider(height: 1, indent: 56),
                    SwitchListTile(
                      title: Text(l10n.sheetNames),
                      subtitle: Text(l10n.sheetNamesDesc),
                      secondary: const Icon(Icons.table_chart_rounded),
                      value: settings.translateSheetNames,
                      onChanged: (val) {
                        settingsManager.updateTranslateSheetNames(val);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // THEME SECTION
              _buildSectionHeader(context, l10n.appearance, Icons.palette_rounded),
              const SizedBox(height: 8),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(l10n.appLanguage),
                      subtitle: Text(
                        settings.appLocale.isEmpty
                            ? l10n.systemDefault
                            : nativeLanguageName(settings.appLocale),
                      ),
                      leading: const Icon(Icons.language_rounded),
                      trailing: Icon(chevron),
                      onTap: () {
                        AppLanguageSheet.show(
                          context: context,
                          selectedTag: settings.appLocale,
                          onSelected: settingsManager.updateAppLocale,
                        );
                      },
                    ),
                    const Divider(height: 1, indent: 56),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.appTheme,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          const SizedBox(height: 12),
                          SegmentedButton<ThemeMode>(
                            segments: [
                              ButtonSegment(
                                value: ThemeMode.system,
                                label: Text(l10n.themeSystem),
                                icon: const Icon(Icons.brightness_auto_rounded),
                              ),
                              ButtonSegment(
                                value: ThemeMode.light,
                                label: Text(l10n.themeLight),
                                icon: const Icon(Icons.light_mode_rounded),
                              ),
                              ButtonSegment(
                                value: ThemeMode.dark,
                                label: Text(l10n.themeDark),
                                icon: const Icon(Icons.dark_mode_rounded),
                              ),
                            ],
                            selected: {settings.themeMode},
                            onSelectionChanged: (newSelection) {
                              settingsManager
                                  .updateThemeMode(newSelection.first);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ABOUT SECTION
              _buildSectionHeader(context, l10n.about, Icons.info_outline_rounded),
              const SizedBox(height: 8),
              Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Atoll v1.0.0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        l10n.aboutDescription,
                        style: const TextStyle(fontSize: 13, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

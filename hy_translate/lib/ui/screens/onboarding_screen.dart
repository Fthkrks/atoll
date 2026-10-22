import 'package:flutter/material.dart';
import '../../core/model/model_manager.dart';
import '../../l10n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  final ModelManager modelManager;

  const OnboardingScreen({
    super.key,
    required this.modelManager,
  });

  static String formatExpectedSize() {
    return (ModelManager.expectedSize / (1024 * 1024 * 1024)).toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 540),
            child: ListenableBuilder(
              listenable: modelManager,
              builder: (context, _) {
                final status = modelManager.status;
                final progress = modelManager.downloadProgress;
                final statusMsg = modelManager.statusMessageOf(l10n);
                final sizeGb = formatExpectedSize();

                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header: Logo / Icon
                      Center(
                        child: Container(
                          width: 84,
                          height: 84,
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.translate_rounded,
                            size: 44,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Headline
                      Text(
                        l10n.onboardingHeadline,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Benefits
                      Card(
                        elevation: 0,
                        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              _BenefitTile(
                                icon: Icons.cloud_off_rounded,
                                text: l10n.onboardingBenefitOffline,
                              ),
                              const Divider(height: 24),
                              _BenefitTile(
                                icon: Icons.shield_outlined,
                                text: l10n.onboardingBenefitPrivate,
                              ),
                              const Divider(height: 24),
                              _BenefitTile(
                                icon: Icons.article_outlined,
                                text: l10n.onboardingBenefitFormats,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // Dynamic Status & Actions
                      _buildActionSection(
                        context: context,
                        status: status,
                        progress: progress,
                        statusMsg: statusMsg,
                        sizeGb: sizeGb,
                        l10n: l10n,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionSection({
    required BuildContext context,
    required ModelStatus status,
    required ModelDownloadProgress? progress,
    required String statusMsg,
    required String sizeGb,
    required AppLocalizations l10n,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (status == ModelStatus.downloading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: (progress != null && progress.fraction > 0)
                ? progress.fraction
                : null,
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 10),
          if (progress != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    progress.statusText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Text(
                  '${(progress.fraction * 100).toStringAsFixed(1)}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingBackgroundNote,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.tonalIcon(
            onPressed: () => modelManager.cancelDownload(),
            icon: const Icon(Icons.cancel_outlined),
            label: Text(l10n.cancelDownload),
            style: FilledButton.styleFrom(
              foregroundColor: colorScheme.error,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ],
      );
    }

    if (status == ModelStatus.ready || modelManager.isReady) {
      return const SizedBox.shrink();
    }

    if (status == ModelStatus.verifying ||
        status == ModelStatus.loading ||
        modelManager.isInitializing) {
      return Column(
        children: [
          const SizedBox(height: 8),
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            statusMsg,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
      );
    }

    if (status == ModelStatus.error) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.error.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  color: colorScheme.error,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    statusMsg,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => modelManager.downloadModel(),
            icon: const Icon(Icons.refresh_rounded),
            label: Text(l10n.onboardingTryAgain),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () => modelManager.pickModelFile(),
            icon: const Icon(Icons.folder_open_rounded),
            label: Text(l10n.onboardingHaveGguf),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      );
    }

    // Default: ModelStatus.notDownloaded
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline_rounded,
              size: 16,
              color: colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                l10n.onboardingSizeNote(sizeGb),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: (status == ModelStatus.downloading ||
                  status == ModelStatus.verifying ||
                  status == ModelStatus.loading ||
                  status == ModelStatus.ready ||
                  modelManager.isReady ||
                  modelManager.isInitializing)
              ? null
              : () => modelManager.downloadModel(),
          icon: const Icon(Icons.download_rounded),
          label: Text(l10n.onboardingDownloadButton),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        const SizedBox(height: 10),
        TextButton.icon(
          onPressed: () => modelManager.pickModelFile(),
          icon: const Icon(Icons.folder_open_rounded),
          label: Text(l10n.onboardingHaveGguf),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ],
    );
  }
}

class _BenefitTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _BenefitTile({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

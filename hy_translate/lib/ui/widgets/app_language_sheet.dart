import 'package:flutter/material.dart';
import '../../core/languages/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_support.dart';

/// Bottom sheet that lets the user pick the app (UI) language.
///
/// [selectedTag] is the stored tag (`''` = system default). Every language is
/// shown by its native name so it can always be recognised.
class AppLanguageSheet extends StatelessWidget {
  final String selectedTag;
  final ValueChanged<String> onSelected;

  const AppLanguageSheet({
    super.key,
    required this.selectedTag,
    required this.onSelected,
  });

  static Future<void> show({
    required BuildContext context,
    required String selectedTag,
    required ValueChanged<String> onSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => AppLanguageSheet(
        selectedTag: selectedTag,
        onSelected: onSelected,
      ),
    );
  }

  /// Tags of all UI languages, ordered by English name.
  static List<String> get tags {
    final items = [...Languages.supportedLanguages]
      ..sort((a, b) => a.englishName.compareTo(b.englishName));
    return [for (final i in items) i.code];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final entries = <(String, String)>[
      ('', l10n.systemDefault),
      for (final t in tags) (t, nativeLanguageName(t)),
    ];

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withAlpha(80),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                l10n.appLanguage,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final (tag, name) = entries[index];
                  final isSelected = tag == selectedTag;
                  return ListTile(
                    title: Text(
                      name,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    trailing: isSelected
                        ? Icon(Icons.check, color: theme.colorScheme.primary)
                        : null,
                    onTap: () {
                      onSelected(tag);
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

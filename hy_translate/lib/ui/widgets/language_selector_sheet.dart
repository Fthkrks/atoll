import 'package:flutter/material.dart';
import '../../core/languages/language_item.dart';
import '../../core/languages/languages.dart';
import '../../l10n/app_localizations.dart';
import '../../l10n/l10n_support.dart';

class LanguageSelectorSheet extends StatefulWidget {
  final LanguageItem selected;
  final bool isSource;
  final ValueChanged<LanguageItem> onSelected;

  const LanguageSelectorSheet({
    super.key,
    required this.selected,
    required this.isSource,
    required this.onSelected,
  });

  static Future<void> show({
    required BuildContext context,
    required LanguageItem selected,
    required bool isSource,
    required ValueChanged<LanguageItem> onSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => LanguageSelectorSheet(
        selected: selected,
        isSource: isSource,
        onSelected: onSelected,
      ),
    );
  }

  @override
  State<LanguageSelectorSheet> createState() => _LanguageSelectorSheetState();
}

class _LanguageSelectorSheetState extends State<LanguageSelectorSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _filter = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allLanguages = <LanguageItem>[
      if (widget.isSource) Languages.auto,
      ...Languages.supportedLanguages,
    ];

    final filtered = allLanguages.where((lang) {
      if (_filter.isEmpty) return true;
      final q = _filter.toLowerCase();
      return languageName(context, lang).toLowerCase().contains(q) ||
          nativeLanguageName(lang.code).toLowerCase().contains(q) ||
          lang.englishName.toLowerCase().contains(q) ||
          lang.chineseName.contains(q) ||
          lang.code.toLowerCase().contains(q);
    }).toList();

    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

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
                widget.isSource ? l10n.selectSourceLanguage : l10n.selectTargetLanguage,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.searchLanguage,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _filter.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _filter = '');
                          },
                        )
                      : null,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                onChanged: (val) => setState(() => _filter = val),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final lang = filtered[index];
                  final isSelected = lang.code.toLowerCase() ==
                      widget.selected.code.toLowerCase();

                  final title = languageName(context, lang);
                  final native = lang.code == Languages.autoCode
                      ? null
                      : nativeLanguageName(lang.code);
                  return ListTile(
                    title: Text(
                      title,
                      style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    subtitle: native == null || native == title
                        ? null
                        : Text(native, style: theme.textTheme.bodySmall),
                    trailing: isSelected
                        ? Icon(Icons.check, color: theme.colorScheme.primary)
                        : null,
                    onTap: () {
                      widget.onSelected(lang);
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

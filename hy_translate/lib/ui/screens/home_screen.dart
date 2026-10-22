import 'dart:ui';

import 'package:flutter/material.dart';
import '../../core/model/model_manager.dart';
import '../../core/settings/settings_manager.dart';
import '../../l10n/app_localizations.dart';
import 'document_translation_screen.dart';
import '../widgets/dock_metrics.dart';
import 'settings_screen.dart';
import 'text_translation_screen.dart';

class HomeScreen extends StatefulWidget {
  final SettingsManager settingsManager;
  final ModelManager modelManager;

  const HomeScreen({
    super.key,
    required this.settingsManager,
    required this.modelManager,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 280);

  late final List<Widget> _screens;
  late final AnimationController _controller;
  late final CurvedAnimation _curve;
  int _currentIndex = 0;
  int _previousIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      TextTranslationScreen(
        modelManager: widget.modelManager,
        settingsManager: widget.settingsManager,
      ),
      DocumentTranslationScreen(
        modelManager: widget.modelManager,
        settingsManager: widget.settingsManager,
      ),
      SettingsScreen(
        modelManager: widget.modelManager,
        settingsManager: widget.settingsManager,
      ),
    ];
    _controller = AnimationController(
      vsync: this,
      duration: _duration,
      value: 1,
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _curve.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _select(int index) {
    if (index == _currentIndex) return;
    setState(() {
      _previousIndex = _currentIndex;
      _currentIndex = index;
    });
    _controller.forward(from: 0);
  }

  Widget _buildTab(int i) {
    // Direction: higher index enters from the right, lower from the left.
    final rtl = Directionality.of(context) == TextDirection.rtl;
    final dir = (_currentIndex >= _previousIndex ? 1.0 : -1.0) * (rtl ? -1.0 : 1.0);
    const shift = 0.06;
    return AnimatedBuilder(
      animation: _curve,
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: _screens[i],
      ),
      builder: (context, child) {
        final t = _curve.value;
        final animating = _controller.isAnimating;
        final isCurrent = i == _currentIndex;
        final isLeaving = animating && i == _previousIndex && !isCurrent;
        final visible = isCurrent || isLeaving;
        final opacity = isCurrent ? t : (isLeaving ? 1 - t : 0.0);
        final dx = isCurrent
            ? dir * shift * (1 - t)
            : (isLeaving ? -dir * shift * t : 0.0);
        return Offstage(
          offstage: !visible,
          child: TickerMode(
            enabled: isCurrent,
            child: IgnorePointer(
              ignoring: !isCurrent || animating,
              child: Opacity(
                opacity: opacity.clamp(0.0, 1.0),
                child: FractionalTranslation(
                  translation: Offset(dx, 0),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final viewBottomInset = View.maybeOf(context)?.viewInsets.bottom ?? 0;
    final keyboardVisible =
        MediaQuery.viewInsetsOf(context).bottom > 0 || viewBottomInset > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [for (var i = 0; i < _screens.length; i++) _buildTab(i)],
      ),
      extendBody: true,
      bottomNavigationBar: keyboardVisible
          ? null
          : SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      DockMetrics.dockBottomMargin,
                    ),
                    child: _FloatingDock(
                      selectedIndex: _currentIndex,
                      onSelected: _select,
                    ),
                  ),
                  SizedBox(
                    height: DockMetrics.signatureHeight,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).madeBy,
                        style: TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.4,
                          color: scheme.onSurfaceVariant.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

String _textLabel(AppLocalizations l) => l.navText;
String _documentsLabel(AppLocalizations l) => l.navDocuments;
String _settingsLabel(AppLocalizations l) => l.navSettings;

class _DockItem {
  final IconData icon;
  final IconData selectedIcon;
  final String Function(AppLocalizations) label;

  const _DockItem(this.icon, this.selectedIcon, this.label);
}

class _FloatingDock extends StatelessWidget {
  static const double _height = DockMetrics.dockHeight;
  static const _items = [
    _DockItem(Icons.translate_outlined, Icons.translate_rounded, _textLabel),
    _DockItem(Icons.description_outlined, Icons.description_rounded, _documentsLabel),
    _DockItem(Icons.settings_outlined, Icons.settings_rounded, _settingsLabel),
  ];

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _FloatingDock({required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    const radius = BorderRadius.all(Radius.circular(_height / 2));

    return Container(
      height: _height,
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: radius,
              border: Border.all(
                color: scheme.outline.withValues(alpha: 0.25),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                for (var i = 0; i < _items.length; i++)
                  Expanded(
                    child: _DockButton(
                      item: _items[i],
                      selected: i == selectedIndex,
                      onTap: () => onSelected(i),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DockButton extends StatelessWidget {
  final _DockItem item;
  final bool selected;
  final VoidCallback onTap;

  const _DockButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final label = item.label(AppLocalizations.of(context));
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkResponse(
        onTap: onTap,
        highlightShape: BoxShape.rectangle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: 56,
              height: 32,
              decoration: BoxDecoration(
                color: selected ? scheme.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                selected ? item.selectedIcon : item.icon,
                size: 22,
                color: selected ? scheme.onPrimary : scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? scheme.primary : scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

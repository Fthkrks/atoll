import 'package:flutter/widgets.dart';

/// Shared layout metrics of the floating dock + signature in the home shell.
class DockMetrics {
  DockMetrics._();

  static const double dockHeight = 72;
  static const double dockBottomMargin = 4;
  static const double signatureHeight = 22;

  /// Total space the bottom bar occupies above the system inset.
  static const double barHeight =
      dockHeight + dockBottomMargin + signatureHeight;

  /// Bottom space a screen's content must reserve to scroll clear of the dock.
  static double clearance(BuildContext context) {
    final viewBottomInset = View.maybeOf(context)?.viewInsets.bottom ?? 0;
    if (MediaQuery.viewInsetsOf(context).bottom > 0 || viewBottomInset > 0) {
      return 0.0;
    }
    return barHeight + MediaQuery.viewPaddingOf(context).bottom;
  }
}

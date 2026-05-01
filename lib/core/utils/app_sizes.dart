part of 'design_utils.dart';

class AppSizes {
  AppSizes._();

  /// Minimum window size on Windows / macOS / Linux / web.
  static const Size minDesktop = Size(1080, 600);

  /// Custom title bar height on desktop platforms.
  static const double titleBarHeight = 56;

  /// Wide-layout breakpoint (split-pane).
  static const double wideBreakpoint = 1080;
}

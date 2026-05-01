part of 'design_utils.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: splashBgLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentLight,
      brightness: Brightness.light,
    ),
  );

  static ThemeData dark() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: splashBgDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentDark,
      brightness: Brightness.dark,
    ),
  );
}

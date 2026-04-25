part of 'design_utils.dart';

class CustomTheme {
  // light theme
  static final lightTheme = ThemeData(
    primaryColor: lightThemeColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: white,
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      thumbColor:
      WidgetStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: appColor,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
          color: black,
          fontSize: 16
      ),
      iconTheme: IconThemeData(color: lightThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: lightThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );

  // dark theme
  static final darkTheme = ThemeData(
    primaryColor: darkThemeColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    useMaterial3: true,
    switchTheme: SwitchThemeData(
      trackColor:
      WidgetStateProperty.resolveWith<Color>((states) => darkThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      backgroundColor: appColor,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: white,
      ),
      iconTheme: IconThemeData(color: darkThemeColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: darkThemeColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: appColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );

  // colors
  static Color lightThemeColor = Colors.black,
      white = Colors.white,
      black = Colors.black,
      appColor = Colors.blue,
      darkThemeColor = Colors.white,
      linearGradientEnd = Colors.blue,
      linearGradientStart = Colors.blue.withValues(alpha: 0.5),
      red = Colors.red;
}

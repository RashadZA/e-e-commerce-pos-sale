part of 'design_utils.dart';

class AppTheme {
  AppTheme._();

  static const double defaultIconSize = 24;

  static const double defaultElevation = 2;

  static const double appBarHeight = 60;

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: lightThemeColor,
    brightness: Brightness.light,
    primaryColorLight: lightThemeColor,
    splashColor: transparentColor,
    scaffoldBackgroundColor: backgroundColorForLightMode,
    hintColor: primaryColor.withValues(alpha: .4),
    iconTheme: const IconThemeData(size: defaultIconSize),
    switchTheme: SwitchThemeData(
      thumbColor:
      WidgetStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: false,
      elevation: defaultElevation,
      toolbarHeight: appBarHeight,
      iconTheme: IconThemeData(size: defaultIconSize,color: appBarIconPrimaryColor),
      titleTextStyle: AppTextTheme.text18
          .copyWith(color: whiteColor, fontWeight: FontWeight.w600),
      backgroundColor: primaryColor,
    ),
    cardColor: cardColor,
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: primaryColor,selectionColor: primaryColor,selectionHandleColor: primaryColor,),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: primaryShadowColor,
      scaffoldBackgroundColor: primaryShadowColor,
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextTheme.text14
            .copyWith(color: whiteColor, fontWeight: FontWeight.w600),
        primaryColor: primaryColor,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set custom border radius
      ),
      backgroundColor: Colors.white, // Set the background color of the picker
      elevation: 4.0, // Customize the elevation for shadow effects
      shadowColor: Colors.grey, // Color for the shadow
      headerBackgroundColor: primaryColor, // Background color for the header
      headerForegroundColor: Colors.white, // Text color for the header
      headerHeadlineStyle: AppTextTheme.text22.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ), // Style for the headline text in the header
      headerHelpStyle: AppTextTheme.text18.copyWith(
        color: Colors.white,
      ), // Style for the help text in the header
      weekdayStyle: AppTextTheme.text18.copyWith(
        color: primaryColor,
        fontWeight: FontWeight.w500,
      ), // Style for weekdays
      dayStyle: AppTextTheme.text16,
      yearStyle: AppTextTheme.text16,
      yearForegroundColor: WidgetStateProperty.all(Colors.black), // Foreground color for days
      yearBackgroundColor: WidgetStateProperty.all(Colors.white), // Foreground color for days
      dayForegroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // Foreground color for selected day
        }
        return Colors.black; // Default day color
      }), // Foreground color for days
      dayBackgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor; // Background color for selected day
        }
        return Colors.transparent; // Default background
      }), // Foreground color for days
      todayForegroundColor: WidgetStateProperty.all(Colors.white), // Foreground color for today
      todayBackgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColor; // Background color for selected day
        }
        return primaryColor.withValues(alpha: 0.5); // Default Background color for today
      }),
      rangePickerBackgroundColor: Colors.grey[200], // Background color for range picker
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextTheme.text16),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(Colors.green),
      ), // Style for confirm button
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextTheme.text16),
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(Colors.redAccent),
      ), // Style for cancel button
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextTheme.text14.copyWith(
            color: primaryColor
        ),
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        filled: false, // Ensure the field is not filled
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    ),
  );

  // dark theme
  static final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: darkThemeColor,
    primaryColorLight: darkThemeColor,
    splashColor: transparentColor,
    scaffoldBackgroundColor: backgroundColorForDarkMode,
    hintColor: darkThemeColor.withValues(alpha: .4),
    iconTheme: const IconThemeData(size: defaultIconSize),
    appBarTheme: AppBarTheme(
      elevation: defaultElevation,
      toolbarHeight: appBarHeight,
      iconTheme: const IconThemeData(size: defaultIconSize,color: whiteColor),
      titleTextStyle: AppTextTheme.text18
          .copyWith(color: whiteColor, fontWeight: FontWeight.w600),
      backgroundColor: primaryColorForDarkMode,
    ),
    cardColor: cardColor,
    textSelectionTheme:
    const TextSelectionThemeData(cursorColor: primaryColorForDarkMode,selectionColor: primaryColorForDarkMode,selectionHandleColor: primaryColorForDarkMode,),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: primaryColorForDarkMode,
      barBackgroundColor: primaryShadowColor,
      scaffoldBackgroundColor: primaryShadowColor,
      textTheme: CupertinoTextThemeData(
        textStyle: AppTextTheme.text14
            .copyWith(color: whiteColor, fontWeight: FontWeight.w600),
        primaryColor: primaryColorForDarkMode,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Set custom border radius
      ),
      backgroundColor: Colors.black, // Set the background color of the picker
      elevation: 4.0, // Customize the elevation for shadow effects
      shadowColor: Colors.grey, // Color for the shadow
      headerBackgroundColor: primaryColorForDarkMode, // Background color for the header
      headerForegroundColor: Colors.white, // Text color for the header
      headerHeadlineStyle: AppTextTheme.text22.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ), // Style for the headline text in the header
      headerHelpStyle: AppTextTheme.text18.copyWith(
        color: Colors.white,
      ), // Style for the help text in the header
      weekdayStyle: AppTextTheme.text18.copyWith(
        color: primaryColorForDarkMode,
        fontWeight: FontWeight.w500,
      ), // Style for weekdays
      dayStyle: AppTextTheme.text16,
      yearStyle: AppTextTheme.text16,
      yearForegroundColor: WidgetStateProperty.all(Colors.black), // Foreground color for days
      yearBackgroundColor: WidgetStateProperty.all(Colors.white), // Foreground color for days
      dayForegroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // Foreground color for selected day
        }
        return Colors.white; // Default day color
      }), // Foreground color for days
      dayBackgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColorForDarkMode; // Background color for selected day
        }
        return Colors.transparent; // Default background
      }), // Foreground color for days
      todayForegroundColor: WidgetStateProperty.all(Colors.white), // Foreground color for today
      todayBackgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return primaryColorForDarkMode; // Background color for selected day
        }
        return primaryColorForDarkMode.withValues(alpha: 0.5); // Default Background color for today
      }),
      rangePickerBackgroundColor: Colors.grey[200], // Background color for range picker
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextTheme.text16),
        // backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(Colors.green),
      ), // Style for confirm button
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(AppTextTheme.text16),
        // backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(Colors.redAccent),
      ), // Style for cancel button
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppTextTheme.text14.copyWith(
            color: primaryColorForDarkMode
        ),
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        filled: false, // Ensure the field is not filled
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColorForDarkMode),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: primaryColorForDarkMode),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 1, color: Colors.grey),
        ),
      ),
    ),
  );
}

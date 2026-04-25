part of 'design_utils.dart';


List<TextInputFormatter>? defaultPhoneNumberInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')), // Only numbers and +
  // LengthLimitingTextInputFormatter(20),
];

List<TextInputFormatter>? defaultAmountInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
];

List<TextInputFormatter>? defaultQuantityInputFormatters = [
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
];
List<TextInputFormatter>? digitsOnlyInputFormatters = [
  FilteringTextInputFormatter.digitsOnly,
];

extension WidgetExtension on Widget {
  List<BoxShadow> get containerShadow => [
        BoxShadow(
          color: cardShadowColor,
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1),
        ),
        BoxShadow(
          color: cardShadowColor,
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1),
        ),
      ];

  Divider defaultDivider({double? thickness, Color? color, double? height}) {
    return Divider(
        thickness: thickness ?? 1,
        color: color ?? greyColorOpacity08,
        height: height ?? 20);
  }

  Container defaultContainer({
    Color? backgroundColor,
    Color? boxShadowColor,
    double borderRadius = 5.0,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? whiteColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: boxShadowColor ?? coreTextFieldShadowColor,
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: padding ??
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        margin: margin,
        child: this,
      );

}

extension StringExtension on String {
  /// Dynamic Toast method
  void showToast({
    ToastGravity? gravity,
    Duration? duration,
    Color? backgroundColor,
    Color? textColor,
    double fontSize = 16.0,
  }) {
    Fluttertoast.cancel(); // Close any previous toast
    Fluttertoast.showToast(
      msg: this,
      toastLength: (duration != null && duration.inSeconds > 2)
          ? Toast.LENGTH_LONG
          : Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.TOP,
      backgroundColor: backgroundColor ?? Colors.grey.shade800,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize,
      timeInSecForIosWeb: duration?.inSeconds ?? 3,
    );
  }

  /// Error toast
  void errorSnackBar({ToastGravity? gravity, Duration? duration}) {
    showToast(
      gravity: gravity,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: Colors.red.shade300,
      textColor: Colors.white,
    );
  }

  /// Success toast
  void successSnackBar({ToastGravity? gravity, Duration? duration}) {
    showToast(
      gravity: gravity,
      duration: duration ?? const Duration(seconds: 2),
      backgroundColor: Colors.green.shade300,
      textColor: Colors.white,
    );
  }

  /// Info toast
  void infoSnackBar({ToastGravity? gravity, Duration? duration}) {
    showToast(
      gravity: gravity,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: Colors.blue.shade200,
      textColor: Colors.black,
    );
  }
}


Widget defaultFrame({
  required Widget column,
  required String title,
  double? width,
  Color? frameBarColor,
  Color? frameBorderColor,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        width: 0.5,
        color: frameBorderColor ?? primaryColor,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: frameBarColor ?? primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: Text(
            title,
            style: AppTextTheme.text18.copyWith(
              color: whiteColor,
            ),
          ),
        ),
        column,
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget defaultLoader({
  Color? color,
  double? radius,
  double? width,
  double? height,
  double? value,
  double? strokeWidth,
}) =>
    Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
          color: color ?? primaryColor,
          backgroundColor: color != null ? color.withValues(alpha: 0.5) : primaryColor.withValues(alpha: 0.5),
          value: value,
        ),
      ),
    );

Widget defaultLoaderWithoutCenter({
  Color? color,
  double? radius,
  double? width,
  double? height,
  double? value,
  EdgeInsetsGeometry? padding,
}) =>
    SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10.0),
        child: CircularProgressIndicator(
          color: color ?? primaryColor,
          value: value,
        ),
      ),
    );

Widget emptyMessage({
  Color? color,
  double? size,
  double? width,
  double? height,
  required String message,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: Center(
      child: Text(
          message,
        textAlign: TextAlign.center,
        style: AppTextTheme.text16.copyWith(
          color: color ?? appTextPrimaryColor,
        )
      ),
    ),
  );
}

OutlineInputBorder defaultFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  borderSide: BorderSide(width: 1, color: greyColor),
);

OutlineInputBorder defaultEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  borderSide: const BorderSide(width: 1, color: greyColor),
);

OutlineInputBorder defaultFocusedErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  borderSide: const BorderSide(width: 1, color: greyColor),
);

OutlineInputBorder defaultErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  borderSide: const BorderSide(width: 1, color: greyColor),
);
OutlineInputBorder defaultDisableBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(defaultBorderRadiusValue),
  borderSide: const BorderSide(width: 0, color: transparentColor),
);

OutlineInputBorder customFocusedBorder({double? width, double? radius, Color? color}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(radius ?? defaultBorderRadiusValue),
  borderSide: BorderSide(width: width ?? 1, color: color ?? greyColor.withValues(alpha: .67)),
);

OutlineInputBorder customEnabledBorder({double? width, double? radius, Color? color}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(radius ?? defaultBorderRadiusValue),
  borderSide: BorderSide(width: width ?? 1, color: color ?? greyColor),
);

OutlineInputBorder customFocusedErrorBorder({double? width, double? radius, Color? color}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(radius ?? defaultBorderRadiusValue),
  borderSide: BorderSide(width: width ?? 1, color: color ?? greyColor),
);

OutlineInputBorder customErrorBorder({double? width, double? radius, Color? color}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(radius ?? defaultBorderRadiusValue),
  borderSide: BorderSide(width: width ?? 1, color: color ?? redAccentColor),
);

// ─────────────────────────────────────────────────────────────────────────────
//  Shared helpers
// ─────────────────────────────────────────────────────────────────────────────
Widget sectionCardCustomWidget({required bool isDark, required Widget child, EdgeInsetsGeometry? padding}) {
  return Container(
    width: double.infinity,
    padding: padding ?? EdgeInsets.all(defaultPaddingValue),
    decoration: BoxDecoration(
      color: isDark ? cardColorForDarkMode : cardColorForLightMode,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: isDark ? cardShadowColorForDarkMode : cardShadowColor,
          spreadRadius: isDark ? 3 : 1,
          blurRadius:   isDark ? 3 : 1,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: child,
  );
}
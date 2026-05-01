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
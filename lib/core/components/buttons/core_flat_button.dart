import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/core_button.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';

class CoreFlatButton extends StatelessWidget {
  final String? text;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;
  final double? width;
  final double? loaderWidth;
  final double height;
  final double? loaderHeight;
  final Color? bgColor;
  final double? fontSize;
  final Color? textColor;
  final Color? buttonIconColor;
  final BoxBorder? border;
  final Color? loaderColor;
  final bool isLoading;
  final IconData? suffixIcon;
  final IconData? buttonIcon;
  final double? suffixIconSize;
  final double? buttonIconSize;
  final Color? suffixIconColor;
  final bool isGradientBg;
  final bool isDisabled;
  final bool isDark;
  final EdgeInsets padding;
  final double borderRadius;
  final void Function()? onPressed;
  const CoreFlatButton({
    super.key,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.border,
    this.bgColor,
    this.textColor,
    this.onPressed,
    this.fontSize,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.loaderColor,
    this.loaderWidth,
    this.loaderHeight,
    this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.borderRadius = 25.0,
    this.isGradientBg = false,
    this.width = double.infinity,
    this.height = 45,
    this.padding = EdgeInsets.zero,
    this.buttonIconSize,
    this.buttonIconColor,
    this.buttonIcon,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      onPressed: isLoading ? null : onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Opacity(
        opacity: isDisabled || onPressed == null ? 0.5 : 1,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            gradient: isGradientBg
                ? LinearGradient(
                    colors: [
                      isDark ? buttonGradientStartColorForDarkMode : buttonGradientStartColor,
                      isDark ? buttonGradientEndColorForDarkMode :  buttonGradientEndColor
                    ],
                  )
                : null,
            color: bgColor ?? buttonPrimaryColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                defaultLoader(
                  width: loaderWidth ?? 30,
                  height: loaderHeight ?? 30,
                  color: loaderColor ?? whiteColor,
                )
              else ...[
                if (prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: prefixIconColor,
                    ),
                  ),
                text != null ? Text(
                  text!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize ?? 16,
                    letterSpacing: -0.24,
                    fontWeight: FontWeight.w600,
                    color: textColor ?? whiteColor,
                    fontFamily: AppTextTheme.getDefaultFontFamily,
                  ),
                ) : Icon(buttonIcon ?? Icons.arrow_forward_outlined,size: buttonIconSize ?? 35,color: buttonIconColor ?? whiteColor,),
                if (suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      suffixIcon,
                      size: suffixIconSize,
                      color: suffixIconColor,
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

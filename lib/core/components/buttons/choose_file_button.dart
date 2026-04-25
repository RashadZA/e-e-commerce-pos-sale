import 'package:flutter/material.dart';
import 'package:e_commerce_pos_sale/core/utils/design_utils.dart';
import 'package:e_commerce_pos_sale/core/components/buttons/core_button.dart';

class ChooseFileButton extends StatelessWidget {
  final bool isDark;
  final void Function()? onPressed;
  const ChooseFileButton({super.key, this.onPressed, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      onPressed: onPressed,
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: isDark ? buttonFillColorForDarkMode : buttonFillColorForLightMode,
          boxShadow: [
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isDark ? buttonBorderColorForDarkMode : buttonBorderColor,
            width: 0.5,
          ),
        ),
        child: Text(
          'Choose File',
          style: AppTextTheme.text14.copyWith(
            color: isDark ? appTextPrimaryColorForDarkMode : appTextPrimaryColorForLightMode,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ViewFileButton extends StatelessWidget {
  final bool isDark;
  final void Function()? onPressed;
  const ViewFileButton({super.key, this.onPressed, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      onPressed: onPressed,
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: isDark ? buttonFillColorForDarkMode : buttonFillColorForLightMode,
          boxShadow: [
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isDark ? buttonBorderColorForDarkMode : buttonBorderColor,
            width: 0.5,
          ),
        ),
        child: Text(
          'View File',

          style: AppTextTheme.text14.copyWith(
            color: isDark ? appTextPrimaryColorForDarkMode : appTextPrimaryColorForLightMode,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ClearFileButton extends StatelessWidget {
  final bool isDark;
  final void Function()? onPressed;
  const ClearFileButton({super.key, this.onPressed, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CoreButton(
      onPressed: onPressed,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: isDark ? buttonFillColorForDarkMode : buttonFillColorForLightMode,
          boxShadow: [
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: buttonShadowColor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isDark ? buttonBorderColorForDarkMode : buttonBorderColor,
            width: 0.5,
          ),
        ),
        child: Text(
          'Clear File',

          style: AppTextTheme.text14.copyWith(
            color: isDark ? appTextPrimaryColorForDarkMode : appTextPrimaryColorForLightMode,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ChooseFileLoadingButton extends StatelessWidget {
  final bool isDark;
  const ChooseFileLoadingButton({super.key, required this.isDark,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: isDark ? buttonFillColorForDarkMode : buttonFillColorForLightMode,
        boxShadow: [
          BoxShadow(
            color: buttonShadowColor,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: buttonShadowColor,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: isDark ? buttonBorderColorForDarkMode : buttonBorderColor,
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          defaultLoader(
            width: 15,
            height: 15,
            strokeWidth: 1,
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 99,
            child: Text(
              'Please wait..',
              style: AppTextTheme.text14.copyWith(
                overflow: TextOverflow.visible,
                color: isDark ? appTextPrimaryColorForDarkMode : appTextPrimaryColorForLightMode,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../constant/colors.dart';
import '../constant/typography.dart';

class ButtonComponent extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final ButtonVariant variant;
  final Color? color;

  const ButtonComponent({
    Key? key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = _getBackgroundColor(context);

    return ZoomTapAnimation(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: TypographyStyles.button(
            text,
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))),
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return color ?? PrimaryColors.main;
      case ButtonVariant.secondary:
        return color ?? BackgroundColors.lightInTheDark;
    }
  }
}

enum ButtonVariant {
  primary,
  secondary,
}

class ButtonNoFill extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const ButtonNoFill({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              width: 1.w,
              color: PrimaryColors.main,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 7.h),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.download,
              color: PrimaryColors.main,
            ),
            SizedBox(width: 2.w),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h),
              child: TypographyStyles.button(
                text,
                color: PrimaryColors.main,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

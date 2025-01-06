import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/typography.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onTab2;
  final VoidCallback? onTab3;
  final Color? backgroundColor;
  final double? elevation;
  final bool showBottomBorder;
  final PreferredSizeWidget? bottom;

  const AppBarComponent({
    Key? key,
    required this.title,
    this.onBack,
    this.onTab2,
    this.onTab3,
    this.backgroundColor = Colors.transparent,
    this.elevation,
    this.showBottomBorder = false,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.white,
        elevation: elevation,
        centerTitle: true,
        leading: onBack != null
            ? IconButton(
                onPressed: onBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: TextColors.base.withOpacity(0.87),
                  size: 24,
                ),
              )
            : null,
        title: TypographyStyles.h6(
          title,
          textAlign: TextAlign.center,
        ),
        bottom: showBottomBorder
            ? PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: TextColors.base.withOpacity(0.12),
                  height: 1.0,
                ),
              )
            : null,
        actions: [
          if (onTab2 != null)
            IconButton(
              onPressed: onTab2,
              icon: Icon(
                Icons.favorite_border,
                size: 24,
                color: TextColors.base.withOpacity(0.87),
              ),
            ),
        ]);
  }
}

class AppBarPrimary extends AppBarComponent {
  AppBarPrimary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: false);
}

class AppBarSecondary extends AppBarComponent {
  AppBarSecondary({
    required String title,
    VoidCallback? onBack,
    Color? backgroundColor,
    double? elevation,
  }) : super(
            title: title,
            onBack: onBack,
            backgroundColor: backgroundColor,
            elevation: elevation,
            showBottomBorder: true);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      leading: onBack != null
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: TextColors.base.withOpacity(0.87),
              ),
              onPressed: onBack,
            )
          : null,
      title: TypographyStyles.h6(title),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: TextColors.base.withOpacity(0.87),
          height: 1.0,
        ),
      ),
    );
  }
}

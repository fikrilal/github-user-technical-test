import 'package:flutter/material.dart';
import '../../favorite/presentation/bloc/favorite_state.dart';
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
  final bool isFavorite;
  final PreferredSizeWidget? bottom;
  final FavoriteState favoriteState;

  const AppBarComponent({
    super.key,
    required this.title,
    this.onBack,
    this.onTab2,
    this.onTab3,
    this.backgroundColor = Colors.transparent,
    this.elevation,
    this.showBottomBorder = false,
    this.bottom,
    this.isFavorite = false,
    required this.favoriteState,
  });

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
              icon: _getFavoriteIcon()
            ),
        ]);
  }

  Icon _getFavoriteIcon() {
    if (favoriteState is FavoriteLoading) {
      return const Icon(Icons.hourglass_empty);
    } else if (isFavorite) {
      return const Icon(Icons.favorite, color: Colors.red);
    } else {
      return const Icon(Icons.favorite_border);
    }
  }
}
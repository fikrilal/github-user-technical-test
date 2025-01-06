import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../_core/constant/colors.dart';
import '../../../_core/constant/typography.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;

  const UserCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        decoration: BoxDecoration(
          color: NeutralColors.neutral100,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: NeutralColors.neutral100, width: 1),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypographyStyles.bodyMainMedium(name),
                SizedBox(height: 6.h),
                TypographyStyles.bodyCaptionRegular(role),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

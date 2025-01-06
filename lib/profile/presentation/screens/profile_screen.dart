import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../_core/component/textfield_component.dart';
import '../../../_core/constant/typography.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/200',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: TypographyStyles.bodyMainBold('John Doe'),
              ),
              SizedBox(height: 32.h),
              TextFieldComponent(
                labelText: 'Label',
              ),
              SizedBox(height: 16.h),
              TextFieldComponent(
                labelText: 'Label',
              ),
              SizedBox(height: 16.h),
              TextFieldComponent(
                labelText: 'Label',
              ),
              SizedBox(height: 16.h),
              TextFieldComponent(
                labelText: 'Label',
              )
            ],
          ),
        ),
      )),
    );
  }
}

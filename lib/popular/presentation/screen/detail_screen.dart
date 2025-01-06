import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/_core/component/appbar_component.dart';
import '../../../_core/component/button_component.dart';
import '../../../_core/constant/colors.dart';
import '../../../_core/constant/typography.dart';
import '../../domain/entities/user_detail_entity.dart';
import '../../domain/usecases/get_detail_user_usecase.dart';
import '../bloc/user_detail_bloc.dart';
import '../bloc/user_detail_event.dart';
import '../bloc/user_detail_state.dart';

class DetailScreen extends StatelessWidget {
  final String username;

  const DetailScreen({required this.username, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: 'Detail User',
        showBottomBorder: true,
        onTab2: () {

        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocBuilder<UserDetailBloc, UserDetailState>(
            // Access the bloc here
            builder: (context, state) {
              if (state is UserDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserDetailLoaded) {
                final userDetail = state.userDetail;
                return buildUserDetailContent(userDetail);
              } else if (state is UserDetailError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TypographyStyles.bodyMainBold(state.message),
                    SizedBox(height: 10.h),
                    ButtonComponent(
                      text: 'Retry',
                      onPressed: () {
                        context.read<UserDetailBloc>().add(FetchUserDetailEvent(username));
                      },
                    ),
                  ],
                ));
              } else {
                return const Center(child: Text('No Data'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildUserDetailContent(UserDetailEntity userDetail) {
    return Column(
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
                imageUrl: userDetail.avatarUrl,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Center(child: TypographyStyles.bodyMainBold(userDetail.name ?? 'John Doe')),
        SizedBox(height: 32.h),
        buildDetailRow('Name', userDetail.name ?? 'Not Available'),
        buildDetailRow('Email', userDetail.email ?? 'Not Available'),
        buildDetailRow('Location', userDetail.location ?? 'Not Available'),
        buildDetailRow('Company', userDetail.company ?? 'Not Available'),
      ],
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyStyles.bodyCaptionRegular(title),
        SizedBox(height: 8.h),
        TypographyStyles.bodyMainMedium(value),
        SizedBox(height: 4.h),
        const Divider(color: NeutralColors.neutral200),
        SizedBox(height: 16.h),
      ],
    );
  }
}

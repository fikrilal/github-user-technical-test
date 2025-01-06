import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/_core/component/appbar_component.dart';
import '../../../_core/component/button_component.dart';
import '../../../_core/constant/colors.dart';
import '../../../_core/constant/typography.dart';
import '../../../favorite/presentation/bloc/favorite_bloc.dart';
import '../../../favorite/presentation/bloc/favorite_event.dart';
import '../../../favorite/presentation/bloc/favorite_state.dart';
import '../../domain/entities/user_detail_entity.dart';
import '../../domain/entities/user_entity.dart';
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
        favoriteState: context.watch<FavoriteBloc>().state,
        onTab2: () {
          final userDetailState = context.read<UserDetailBloc>().state;
          final favoriteState = context.read<FavoriteBloc>().state;

          if (userDetailState is UserDetailLoaded) {
            final userDetail = userDetailState.userDetail;

            if (favoriteState is FavoriteLoaded) {
              final isFavorite = favoriteState.favorites.any((user) => user.id == userDetail.id);
              final favoriteBloc = context.read<FavoriteBloc>();

              if (isFavorite) {
                favoriteBloc.add(RemoveFavoriteEvent(userDetail.id));
              } else {
                favoriteBloc.add(
                  AddFavoriteEvent(UserEntity(
                    id: userDetail.id,
                    username: userDetail.username ?? '',
                    avatarUrl: userDetail.avatarUrl,
                    htmlUrl: userDetail.htmlUrl,
                  )),
                );
              }
            } else if (favoriteState is FavoriteLoading) {
              // Provide feedback that favorites are still loading
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorites are still loading. Please wait.')),
              );
            } else {
              // Handle other states (e.g., FavoriteError)
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorites are not ready yet.')),
              );
            }
          } else {
            // Handle cases where user detail is not loaded
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User details are not available.')),
            );
          }
        },
        isFavorite: _isUserFavorite(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocBuilder<UserDetailBloc, UserDetailState>(
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
                  ),
                );
              } else {
                return const Center(child: Text('No Data'));
              }
            },
          ),
        ),
      ),
    );
  }

  bool _isUserFavorite(BuildContext context) {
    final favoriteState = context.watch<FavoriteBloc>().state;
    if (favoriteState is FavoriteLoaded) {
      final userDetailState = context.read<UserDetailBloc>().state;
      if (userDetailState is UserDetailLoaded) {
        final userDetail = userDetailState.userDetail;
        return favoriteState.favorites.any((user) => user.id == userDetail.id);
      }
    }
    return false;
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

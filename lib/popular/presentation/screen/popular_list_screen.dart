import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/_core/component/button_component.dart';
import 'package:github_user_technical/_core/component/textfield_component.dart';
import 'package:github_user_technical/_core/constant/colors.dart';
import 'package:github_user_technical/_core/constant/typography.dart';
import 'package:github_user_technical/_core/route/app_route.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_usecase.dart';
import '../bloc/popular_bloc.dart';
import '../bloc/popular_event.dart';
import '../bloc/popular_state.dart';
import '../components/user_card.dart';
import 'detail_screen.dart';

class PopularListScreen extends StatelessWidget {
  const PopularListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularBloc(
        RepositoryProvider.of<GetUsersUseCase>(context),
      )..add(const FetchUsersEvent(forceRefresh: false)),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TypographyStyles.h5('Github User Profile'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  log('Settings button pressed', name: 'PopularListScreen');
                },
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                  text: 'Popular',
                ),
                Tab(
                  icon: Icon(Icons.favorite),
                  text: 'Favorite',
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: TabBarView(
              children: [
                buildPopularContent(),
                buildFavoriteContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPopularContent() {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        if (state is PopularLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularLoaded) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final UserEntity user = state.users[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: UserCard(
                  imageUrl: user.avatarUrl,
                  name: user.username,
                  role: user.htmlUrl,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailScreen,
                      arguments: user.username,
                    );
                  },
                ),
              );
            },
          );
        } else if (state is PopularError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TypographyStyles.bodyMainBold(
                  state.message,
                ),
                SizedBox(height: 10.h),
                ButtonComponent(
                  text: 'Retry',
                  onPressed: () {
                    context.read<PopularBloc>().add(const FetchUsersEvent(forceRefresh: true));
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No Data'),
          );
        }
      },
    );
  }

  Widget buildFavoriteContent() {
    return buildEmptyStateFavorite();
  }

  Widget buildEmptyStateFavorite() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypographyStyles.bodyMainBold(
            'No Favorites Yet!',
          ),
          SizedBox(height: 10.h),
          TypographyStyles.bodyCaptionRegular(
            'Star repositories or bookmark projects to easily find them here later. Let’s build your list of go-to resources!',
          ),
          ButtonComponent(
            text: 'Refresh',
            onPressed: () {
              log('Refresh favorites pressed', name: 'PopularListScreen');
            },
          ),
        ],
      ),
    );
  }
}

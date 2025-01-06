import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/favorite/presentation/screens/favorite_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/detail_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';
import 'package:github_user_technical/profile/presentation/screens/profile_screen.dart';
import '../service/init_service.dart';
import 'app_route.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes(InitService initService) {
    return {
      AppRoutes.popularScreen: (context) => BlocProvider(
        create: (context) =>
        PopularBloc(initService.apiHelper)..add(FetchPopularUsersEvent()),
        child: const PopularListScreen(),
      ),
    };
  }
}
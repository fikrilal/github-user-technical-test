import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/favorite/presentation/screens/favorite_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/detail_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';
import 'package:github_user_technical/profile/presentation/screens/profile_screen.dart';
import '../../popular/domain/usecases/get_user_usecase.dart';
import '../../popular/presentation/bloc/popular_bloc.dart';
import '../service/init_service.dart';
import 'app_route.dart';

class AppPages {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.popularScreen: (context) => const PopularListScreen(),
    };
  }
}
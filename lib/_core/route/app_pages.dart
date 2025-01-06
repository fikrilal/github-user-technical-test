import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/favorite/presentation/screens/favorite_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/detail_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';
import 'package:github_user_technical/profile/presentation/screens/profile_screen.dart';
import '../../popular/domain/usecases/get_detail_user_usecase.dart';
import '../../popular/domain/usecases/get_user_usecase.dart';
import '../../popular/presentation/bloc/popular_bloc.dart';
import '../../popular/presentation/bloc/user_detail_bloc.dart';
import '../../popular/presentation/bloc/user_detail_event.dart';
import '../service/init_service.dart';
import 'app_route.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.popularScreen:
        return MaterialPageRoute(
          builder: (context) => const PopularListScreen(),
        );
      case AppRoutes.detailScreen:
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            final getUserDetailUseCase = RepositoryProvider.of<GetUserDetailUseCase>(context);
            return BlocProvider<UserDetailBloc>(
              create: (_) => UserDetailBloc(getUserDetailUseCase)
                ..add(FetchUserDetailEvent(username)),
              child: DetailScreen(username: username),
            );
          },
        );
      default:
        return null;
    }
  }
}
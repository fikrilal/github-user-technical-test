import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_technical/popular/presentation/screen/detail_screen.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';
import 'package:github_user_technical/profile/presentation/screens/profile_screen.dart';
import '../../favorite/domain/usecase/add_favorite_usecase.dart';
import '../../favorite/domain/usecase/get_favorite_usecase.dart';
import '../../favorite/domain/usecase/remove_favorite_usecase.dart';
import '../../favorite/presentation/bloc/favorite_bloc.dart';
import '../../popular/domain/usecases/get_detail_user_usecase.dart';
import '../../popular/presentation/bloc/user_detail_bloc.dart';
import '../../popular/presentation/bloc/user_detail_event.dart';
import '../../popular/domain/usecases/get_user_usecase.dart';
import '../../popular/presentation/bloc/popular_bloc.dart';
import '../../popular/presentation/bloc/popular_event.dart';
import 'app_route.dart';

class AppPages {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.popularScreen:
        return MaterialPageRoute(
          builder: (context) {
            final getUsersUseCase = RepositoryProvider.of<GetUsersUseCase>(context);
            return BlocProvider<PopularBloc>(
              create: (_) => PopularBloc(getUsersUseCase)
                ..add(const FetchUsersEvent(forceRefresh: true)),
              child: const PopularListScreen(),
            );
          },
        );
      case AppRoutes.detailScreen:
        final username = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            final getUserDetailUseCase = RepositoryProvider.of<GetUserDetailUseCase>(context);
            return MultiBlocProvider(
              providers: [
                BlocProvider<UserDetailBloc>(
                  create: (_) => UserDetailBloc(getUserDetailUseCase)
                    ..add(FetchUserDetailEvent(username)),
                ),
                BlocProvider<FavoriteBloc>(
                  create: (context) => FavoriteBloc(
                    addFavoriteUseCase: RepositoryProvider.of<AddFavoriteUseCase>(context),
                    removeFavoriteUseCase: RepositoryProvider.of<RemoveFavoriteUseCase>(context),
                    getFavoritesUseCase: RepositoryProvider.of<GetFavoritesUseCase>(context),
                  )..add(LoadFavoritesEvent()),
                ),
              ],
              child: DetailScreen(username: username),
            );
          },
        );
      case AppRoutes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      default:
        return null;
    }
  }
}

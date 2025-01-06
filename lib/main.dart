import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/popular/data/repositories/user_detail_repository_impl.dart';
import 'package:github_user_technical/popular/domain/repositories/user_repository.dart';
import 'package:github_user_technical/popular/domain/usecases/get_detail_user_usecase.dart';
import 'package:github_user_technical/popular/domain/usecases/get_user_usecase.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_bloc.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_event.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';

import '_core/route/app_pages.dart';
import '_core/route/app_route.dart';
import '_core/service/init_service.dart';
import 'favorite/domain/repositories/favorite_repository.dart';
import 'favorite/domain/usecase/add_favorite_usecase.dart';
import 'favorite/domain/usecase/get_favorite_usecase.dart';
import 'favorite/domain/usecase/remove_favorite_usecase.dart';
import 'favorite/presentation/bloc/favorite_bloc.dart';

void main() async {
  final initService = InitService();
  await initService.init();

  // Initialize repositories and use cases
  final userRepository = initService.getUserRepository();
  final userDetailRepository = initService.getUserDetailRepository();
  final favoriteRepository = initService.getFavoriteRepository();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (_) => userRepository,
        ),
        RepositoryProvider<UserDetailRepository>(
          create: (_) => userDetailRepository,
        ),
        RepositoryProvider<FavoriteRepository>(
          create: (_) => favoriteRepository,
        ),
        RepositoryProvider<GetUsersUseCase>(
          create: (context) => GetUsersUseCase(
            RepositoryProvider.of<UserRepository>(context),
          ),
        ),
        RepositoryProvider<GetUserDetailUseCase>(
          create: (context) => GetUserDetailUseCase(
            RepositoryProvider.of<UserDetailRepository>(context),
          ),
        ),
        RepositoryProvider<AddFavoriteUseCase>(
          create: (context) => AddFavoriteUseCase(
            RepositoryProvider.of<FavoriteRepository>(context),
          ),
        ),
        RepositoryProvider<RemoveFavoriteUseCase>(
          create: (context) => RemoveFavoriteUseCase(
            RepositoryProvider.of<FavoriteRepository>(context),
          ),
        ),
        RepositoryProvider<GetFavoritesUseCase>(
          create: (context) => GetFavoritesUseCase(
            RepositoryProvider.of<FavoriteRepository>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PopularBloc>(
            create: (context) => PopularBloc(
              RepositoryProvider.of<GetUsersUseCase>(context),
            )..add(const FetchUsersEvent(forceRefresh: true)),
          ),
          BlocProvider<FavoriteBloc>(
            create: (context) => FavoriteBloc(
              addFavoriteUseCase: RepositoryProvider.of<AddFavoriteUseCase>(context),
              removeFavoriteUseCase: RepositoryProvider.of<RemoveFavoriteUseCase>(context),
              getFavoritesUseCase: RepositoryProvider.of<GetFavoritesUseCase>(context),
            )..add(LoadFavoritesEvent()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          title: 'GitHub User App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.popularScreen,
          onGenerateRoute: AppPages.onGenerateRoute,
        );
      },
    );
  }
}

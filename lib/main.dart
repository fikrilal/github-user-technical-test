import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/popular/domain/usecases/get_user_usecase.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_bloc.dart';
import 'package:github_user_technical/popular/presentation/bloc/popular_event.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';

import '_core/route/app_pages.dart';
import '_core/route/app_route.dart';
import '_core/service/init_service.dart';

void main() async {
  final initService = InitService();
  await initService.init();

  final userRepository = initService.getUserRepository();
  final getUsersUseCase = GetUsersUseCase(userRepository);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GetUsersUseCase>(
          create: (_) => getUsersUseCase,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PopularBloc>(
            create: (context) => PopularBloc(
              RepositoryProvider.of<GetUsersUseCase>(context),
            )..add(const FetchUsersEvent(forceRefresh: true)),
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
          routes: AppPages.getRoutes(),
        );
      },
    );
  }
}

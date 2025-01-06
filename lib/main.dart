import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_user_technical/popular/presentation/screen/popular_list_screen.dart';

import '_core/route/app_pages.dart';
import '_core/route/app_route.dart';
import '_core/service/init_service.dart';

void main() async {
  final initService = InitService();
  await initService.init();
  runApp(MyApp(initService: initService));
}


class MyApp extends StatelessWidget {
  final InitService initService;

  const MyApp({required this.initService, super.key});

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
          routes: AppPages.getRoutes(initService),
        );
      },
    );
  }
}
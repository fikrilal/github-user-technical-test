import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_user_technical/popular/data/datasources/local/user_detail_local_datasource.dart';
import 'package:github_user_technical/popular/data/datasources/remote/user_detail_remote_datasource.dart';

import '../../popular/data/datasources/local/user_local_datasource.dart';
import '../../popular/data/datasources/remote/user_remote_datasource.dart';
import '../../popular/data/repositories/user_detail_repository_impl.dart';
import '../../popular/data/repositories/user_repository_impl.dart';
import '../../popular/domain/repositories/user_repository.dart';
import '../database/database_service.dart';
import '../network/api_helper.dart';
import '../network/dio_client.dart';

class InitService {
  late final DioClient dioClient;
  late final ApiHelper apiHelper;
  late final DatabaseService databaseService;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Dio with SSL Pinning
    final dio = await DioClient.createDioWithSSLPinning();
    dioClient = DioClient(dio);
    apiHelper = ApiHelper(dioClient.dio);

    // Initialize SQLite Database
    databaseService = DatabaseService();
    await databaseService.database;
    log('Database initialized', name: 'InitService');

    log('Initialization complete', name: 'InitService');
  }

  UserRepository getUserRepository() {
    final remoteDataSource = UserRemoteDataSourceImpl(apiHelper);
    final localDataSource = UserLocalDataSourceImpl(databaseService);
    return UserRepositoryImpl(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
  }

  UserDetailRepository getUserDetailRepository() {
    final remoteDataSource = UserDetailRemoteDataSource(apiHelper);
    final localDataSource = UserDetailLocalDataSource(databaseService);
    return UserDetailRepository(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
    );
  }
}
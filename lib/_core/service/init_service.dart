import 'dart:developer';

import 'package:flutter/material.dart';

import '../database/database_service.dart';
import '../network/api_helper.dart';
import '../network/dio_client.dart';

class InitService {
  late final DioClient dioClient;
  late final ApiHelper apiHelper;
  late final DatabaseService databaseService;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final dio = await DioClient.createDioWithSSLPinning();
    dioClient = DioClient(dio);
    apiHelper = ApiHelper(dioClient.dio);

    databaseService = DatabaseService();
    await databaseService.database;
    log('Database initialized', name: 'InitService');

    log('Initialization complete', name: 'InitService');
  }
}

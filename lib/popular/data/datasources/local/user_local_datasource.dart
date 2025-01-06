import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import '../../../../_core/data/models/remote/user_local_model.dart';
import '../../../../_core/database/database_service.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUsers(List<UserLocalModel> users);
  Future<List<UserLocalModel>> getCachedUsers();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final DatabaseService databaseService;

  UserLocalDataSourceImpl(this.databaseService);

  @override
  Future<void> cacheUsers(List<UserLocalModel> users) async {
    log('UserLocalDataSourceImpl: Caching ${users.length} users to local database.');
    try {
      final db = await databaseService.database;
      final batch = db.batch();
      for (var user in users) {
        batch.insert(
          'users',
          user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
      log('UserLocalDataSourceImpl: Successfully cached users.');
    } catch (e) {
      log('UserLocalDataSourceImpl: Failed to cache users. Error: $e', level: 3);
      rethrow;
    }
  }

  @override
  Future<List<UserLocalModel>> getCachedUsers() async {
    log('UserLocalDataSourceImpl: Fetching users from local database.');
    try {
      final db = await databaseService.database;
      final result = await db.query('users');
      log('UserLocalDataSourceImpl: Successfully fetched ${result.length} users from local database.');
      return result.map((e) => UserLocalModel.fromMap(e)).toList();
    } catch (e) {
      log('UserLocalDataSourceImpl: Failed to fetch users from local database. Error: $e', level: 3);
      rethrow;
    }
  }
}
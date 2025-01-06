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
  }

  @override
  Future<List<UserLocalModel>> getCachedUsers() async {
    final db = await databaseService.database;
    final result = await db.query('users');
    return result.map((e) => UserLocalModel.fromMap(e)).toList();
  }
}

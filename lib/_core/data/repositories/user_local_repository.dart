import 'package:sqflite/sqflite.dart';
import '../../database/database_constant.dart';
import '../../database/database_service.dart';
import '../models/remote/user_local_model.dart';

class UserLocalRepository {
  final DatabaseService databaseService;

  UserLocalRepository(this.databaseService);

  Future<void> insertUser(UserLocalModel user) async {
    final db = await databaseService.database;
    await db.insert(
      DatabaseConstants.tableUsers,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<UserLocalModel>> getAllUsers() async {
    final db = await databaseService.database;
    final maps = await db.query(DatabaseConstants.tableUsers);

    return maps.map((map) => UserLocalModel.fromMap(map)).toList();
  }

  Future<void> deleteUser(int id) async {
    final db = await databaseService.database;
    await db.delete(
      DatabaseConstants.tableUsers,
      where: '${DatabaseConstants.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearUsers() async {
    final db = await databaseService.database;
    await db.delete(DatabaseConstants.tableUsers);
  }
}
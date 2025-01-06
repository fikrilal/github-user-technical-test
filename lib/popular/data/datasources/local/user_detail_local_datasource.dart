import 'package:sqflite/sqflite.dart';
import '../../../../_core/database/database_constant.dart';
import '../../../../_core/database/database_service.dart';
import '../../models/local/user_detail_local_model.dart';

class UserDetailLocalDataSource {
  final DatabaseService databaseService;

  UserDetailLocalDataSource(this.databaseService);

  Future<void> cacheUserDetail(UserDetailLocalModel userDetail) async {
    final db = await databaseService.database;
    await db.insert(
      DatabaseConstants.tableUserDetails,
      userDetail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserDetailLocalModel?> getCachedUserDetail(int id) async {
    final db = await databaseService.database;
    final result = await db.query(
      DatabaseConstants.tableUserDetails,
      where: '${DatabaseConstants.columnId} = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return UserDetailLocalModel.fromMap(result.first);
    }
    return null;
  }
}

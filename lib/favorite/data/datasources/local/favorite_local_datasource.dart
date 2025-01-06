import 'package:sqflite/sqflite.dart';
import '../../../../_core/database/database_constant.dart';
import '../../../../_core/database/database_service.dart';
import '../../../../popular/domain/entities/user_entity.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addFavorite(UserEntity user);
  Future<void> removeFavorite(int id);
  Future<List<UserEntity>> getFavorites();
  Future<bool> isFavorite(int id);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final DatabaseService databaseService;

  FavoriteLocalDataSourceImpl(this.databaseService);

  @override
  Future<void> addFavorite(UserEntity user) async {
    final db = await databaseService.database;
    await db.insert(
      DatabaseConstants.tableFavorites,
      {
        DatabaseConstants.columnFavoriteId: user.id,
        DatabaseConstants.columnFavoriteUsername: user.username,
        DatabaseConstants.columnFavoriteAvatarUrl: user.avatarUrl,
        DatabaseConstants.columnFavoriteHtmlUrl: user.htmlUrl,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> removeFavorite(int id) async {
    final db = await databaseService.database;
    await db.delete(
      DatabaseConstants.tableFavorites,
      where: '${DatabaseConstants.columnFavoriteId} = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<UserEntity>> getFavorites() async {
    final db = await databaseService.database;
    final result = await db.query(DatabaseConstants.tableFavorites);
    return result.map((e) => UserEntity.fromMap(e)).toList();
  }

  @override
  Future<bool> isFavorite(int id) async {
    final db = await databaseService.database;
    final result = await db.query(
      DatabaseConstants.tableFavorites,
      where: '${DatabaseConstants.columnFavoriteId} = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}

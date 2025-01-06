import 'package:sqflite/sqflite.dart';
import 'database_constant.dart';

class DatabaseSetup {
  static Future<void> createTables(Database db) async {
    // User (list)
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableUsers} (
        ${DatabaseConstants.columnId} INTEGER PRIMARY KEY,
        ${DatabaseConstants.columnUsername} TEXT NOT NULL,
        ${DatabaseConstants.columnAvatarUrl} TEXT NOT NULL,
        ${DatabaseConstants.columnHtmlUrl} TEXT NOT NULL
      )
    ''');

    // User detail
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableUserDetails} (
        ${DatabaseConstants.columnId} INTEGER PRIMARY KEY,
        ${DatabaseConstants.columnName} TEXT,
        ${DatabaseConstants.columnCompany} TEXT,
        ${DatabaseConstants.columnBlog} TEXT,
        ${DatabaseConstants.columnLocation} TEXT,
        ${DatabaseConstants.columnEmail} TEXT,
        ${DatabaseConstants.columnBio} TEXT,
        ${DatabaseConstants.columnTwitterUsername} TEXT,
        ${DatabaseConstants.columnPublicRepos} INTEGER NOT NULL,
        ${DatabaseConstants.columnPublicGists} INTEGER NOT NULL,
        ${DatabaseConstants.columnFollowers} INTEGER NOT NULL,
        ${DatabaseConstants.columnFollowing} INTEGER NOT NULL,
        ${DatabaseConstants.columnCreatedAt} TEXT NOT NULL,
        ${DatabaseConstants.columnUpdatedAt} TEXT NOT NULL
      )
    ''');
  }
}

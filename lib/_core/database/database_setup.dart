import 'package:sqflite/sqflite.dart';
import 'database_constant.dart';

class DatabaseSetup {
  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE ${DatabaseConstants.tableUsers} (
        ${DatabaseConstants.columnId} INTEGER PRIMARY KEY,
        ${DatabaseConstants.columnUsername} TEXT NOT NULL,
        ${DatabaseConstants.columnAvatarUrl} TEXT NOT NULL,
        ${DatabaseConstants.columnHtmlUrl} TEXT NOT NULL
      )
    ''');
  }
}

import 'dart:developer';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database_constant.dart';
import 'database_setup.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  DatabaseService._internal();
  factory DatabaseService() => _instance;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DatabaseConstants.databaseName);

    return await openDatabase(
      path,
      version: DatabaseConstants.databaseVersion,
      onCreate: (db, version) async {
        log('Creating database...', name: 'DatabaseService');
        await DatabaseSetup.createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        log('Upgrading database...', name: 'DatabaseService');
        // Handle migration here
      },
    );
  }

  Future<void> closeDatabase() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
      log('Database closed', name: 'DatabaseService');
    }
  }
}

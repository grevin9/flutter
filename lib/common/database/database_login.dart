import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseLogin {
  static final _version = 1;
  static final _databaseName = 'login.db';
  static final tableName = 'users';
  static final columnId = '_id';
  static final columnUserName = 'username';
  static final columnPassword = 'password';
  static final columnFullName = 'fullname';
  static final columnBOD = 'bod';
  static final columnEmail = 'email';
  static final columnPhone = 'phone';
  static final columnGender = 'gender';

  DatabaseLogin._privateConstructor();

  static final DatabaseLogin instance = DatabaseLogin._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory document = await getApplicationDocumentsDirectory();
    String path = join(document.path, _databaseName);
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY, $columnUserName TEXT, $columnPassword TEXT, $columnFullName TEXT, $columnBOD TEXT, $columnEmail TEXT, $columnPhone TEXT, $columnGender INTEGER)''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    Database db = await instance.database;
    return await db.query(tableName);
  }

  Future<List<Map<String, dynamic>>> getLogin(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String username = row[columnUserName];
    String email = row[columnUserName];
    String phone = row[columnUserName];
    String password = row[columnPassword];
    return await db.rawQuery(
        'SELECT * FROM $tableName WHERE $columnUserName=? OR $columnEmail=? OR $columnPhone=? AND $columnPassword=?',
        ['$username', '$email', '$phone', '$password']);
  }
}

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  factory DB() => _getInstance();
  static DB get instance => _getInstance();
  static DB _instance;
  DB._internal();
  Database _db;

  static _getInstance() {
    if(null == _instance) {
      _instance = new DB._internal();
    }
    return _instance;
  }

  Future<Database> initDatabase() async {
    if(null == _db) {
      var dbPath = join((await getExternalStorageDirectory()).path, 'demo.db');
//      var dbPath = join(await getDatabasesPath(), 'demo.db');
      final database = await openDatabase(
          dbPath,
          onCreate: (db, version) async => _createDatabase(db, version),
          onUpgrade: (db, oldVersion, newVersion) async =>
              _upgradeDatabase(db, oldVersion, newVersion),
          version: 1
      );
      _db = database;
    }
    return _db;
  }

  _createDatabase(Database db, int version) async {
    await db.execute(
      'CREATE TABLE todos(id INTEGER PRIMARY KEY, title TEXT, created_at TEXT, deleted_at TEXT)'
    );
  }

  _upgradeDatabase(Database db, int oldVersion, int newVersion) async {

  }

}

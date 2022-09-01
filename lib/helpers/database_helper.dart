import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('changerate.db');
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    try {
      Batch batch = db.batch();
      batch.execute(
          """CREATE TABLE moneyconverted(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, datecomplete TEXT NOT NULL,
           fromqty FLOAT NOT NULL,toqty FLOAT NOT NULL, fromcurrency TEXT NOT NULL,tocurrency TEXT NOT NULL)""");
      await batch.commit();
      print("Created with success");
    } catch (e) {
      print("e)");
      print(e);
    }
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

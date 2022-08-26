import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  late Database? _db;

  Future<Database> initDb() async {
    // rekipere chemen nan aparèy la
    String databasesPath = await getDatabasesPath();
    return await openDatabase(
      path.join(databasesPath, 'ecom_app.db'),
      onCreate: _onCreate,
      version: 1,
    );
  }

  void _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute(
        """CREATE TABLE categories(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
 name TEXT NOT NULL, image TEXT)""");
    batch.execute(
        """CREATE TABLE products(id INTEGER PRIMARY KEY NOT NULL, name TEXT NOT NUL
 price FLOAT NOT NULL, image TEXT NOT NULL, description TEXT, category INT
 FOREIGN KEY(category) REFERENCES categories(id) 
 ON DELETE NO ACTION ON UPDATE CASCADE)""");
    await batch.commit();
  }
}

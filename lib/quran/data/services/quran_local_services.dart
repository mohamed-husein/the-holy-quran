import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/utils/app_constants.dart';
import '../model/database_model.dart';

class QuranLocalServices {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), AppConstants.dBName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE ${AppConstants.dBTableName} (
          ${AppConstants.columnId} INTEGER NOT NULL,
          ${AppConstants.columnSurah} TEXT NOT NULL,
          ${AppConstants.columnAyah} INTEGER NOT NULL,
          ${AppConstants.columnJuz} INTEGER NOT NULL,
          ${AppConstants.columnSurahNo} INTEGER NOT NULL,
          ${AppConstants.columnVia} TEXT NOT NULL,
          ${AppConstants.columnIndexAyah} INTEGER NOT NULL,
          ${AppConstants.columnLastRead} INTEGER DEFAULT 0
          )''');
      },
    );
  }

  Future<int> insertBookmark(DatabaseModel db) async {
    Database? dbClient = await database;

    int resposne = await dbClient!.insert(
      AppConstants.dBTableName,
      db.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return resposne;
  }

  Future<List<Map<String, dynamic>>> getLastRead() async {
    Database? dbClient = await database;
    List<Map<String, dynamic>> dataLastRead = await dbClient!.query(
      AppConstants.dBTableName,
      where: "${AppConstants.columnLastRead} = ?",
      whereArgs: [1],
    );
    if (dataLastRead.isNotEmpty) {
      return dataLastRead;
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getBookmark() async {
    Database? dbClient = await database;
    List<Map<String, dynamic>> dataBookmark = await dbClient!.query(
      AppConstants.dBTableName,
      where: "${AppConstants.columnLastRead} = ?",
      whereArgs: [0],
    );
    if (dataBookmark.isNotEmpty) {
      return dataBookmark;
    } else {
      return [];
    }
  }

  deleteBookmark(id) async {
    Database? dbClient = await database;
    int response = await dbClient!.delete(AppConstants.dBTableName,
        where: "${AppConstants.columnId} = ?", whereArgs: [id]);
    return response;
  }
}

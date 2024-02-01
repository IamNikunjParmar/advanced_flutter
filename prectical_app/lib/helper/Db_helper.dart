import 'dart:developer';
import 'package:path/path.dart';
import 'package:prectical_app/modal/fb_modal.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._() {
    initDb();
  }
  static final DbHelper dbHelper = DbHelper._();

  late Database database;
  String query = "";

  String MyTable = "MyTalbes";
  String colId = "id";
  String colName = "name";

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = "MyDatabase.db";
    String path = join(dbPath + dbName);

    database = await openDatabase(path, version: 1, onCreate: (db, ver) {
      query =
          "CREATE TABLE IF NOT EXISTS $MyTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT)";

      db
          .execute(query)
          .then((value) => log("$MyTable created...."))
          .onError((error, stackTrace) => log("ERROR: $error"));
    });
  }

  Future<void> insertDb({required MyModal modal}) async {
    Map<String, dynamic> data = modal.toMap;
    data.remove('id');

    await database
        .insert(MyTable, data)
        .then((value) => log("Inserted done..."))
        .onError((error, stackTrace) => log("ERROR:$error"));
  }

  Future<void> updateDb({required MyModal modal}) async {
    await database
        .insert(MyTable, modal.toMap)
        .then((value) => log("Updated done..."))
        .onError((error, stackTrace) => log("ERROR:$error"));
  }

  Future<int> deleteDb({required int id}) async {
    await initDb();

    return database.delete(
      MyTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<MyModal>> getData() async {
    await initDb();
    query = "SELECT * FROM $MyTable";

    List<Map> allData = await database.rawQuery(query);

    return allData.map((e) => MyModal.fromMap(data: e)).toList();
  }
}

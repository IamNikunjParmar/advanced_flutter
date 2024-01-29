import 'dart:developer';
import 'package:database_revision/modal/emp_modal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._() {
    initDb();
  }
  static final DbHelper dbHelper = DbHelper._();

  late Database database;
  String query = "";

  String empTable = "Employee";
  String colId = "id";
  String colName = "name";

  Future<void> initDb() async {
    String dbPath = await getDatabasesPath();
    String dbName = "MyDatabase.db";
    String path = join(dbPath + dbName);

    database = await openDatabase(path, version: 1, onCreate: (db, ver) {
      query =
          "CREATE TABLE IF NOT EXISTS $empTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT)";

      db
          .execute(query)
          .then((value) => log("$empTable created...."))
          .onError((error, stackTrace) => log("ERROR: $error"));
    });
  }

  Future<void> insertDb({required Employee employee}) async {
    Map<String, dynamic> data = employee.toMap;
    data.remove('id');

    await database
        .insert(empTable, data)
        .then((value) => log("Inserted done..."))
        .onError((error, stackTrace) => log("ERROR:$error"));
  }

  Future<void> updateDb({required Employee employee}) async {
    await database
        .insert(empTable, employee.toMap)
        .then((value) => log("Updated done..."))
        .onError((error, stackTrace) => log("ERROR:$error"));
  }

  Future<int> deleteDb({required int id}) async {
    await initDb();

    return database.delete(
      empTable,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<List<Employee>> getData() async {
    await initDb();
    query = "SELECT * FROM $empTable";

    List<Map> allData = await database.rawQuery(query);

    return allData.map((e) => Employee.fromMap(data: e)).toList();
  }
}

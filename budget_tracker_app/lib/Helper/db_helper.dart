import 'package:budget_tracker_app/Modals/student_modal.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {

  DbHelper._(){
    init();
  }

  static final DbHelper dbHelper = DbHelper._();


  late Database database;

  Logger logger = Logger();

  String studTable = "Student";
  String colId = "id";
  String colName = "Name";
  String colCourse = "course";
  String colAge = "age";



  init() async {

    String dbPath =  await getDatabasesPath();

    String path = join(dbPath,'db1.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db,ver){

        String query = "CREATE TABLE $studTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT NOT NULL,$colCourse TEXT DEFAULT 'FLUTTER',$colAge INTEGER CHECK($colAge >= 18 AND $colAge <= 30))";

        db.
        execute(query)

            .then((value) => logger.i("TABLE CREATED..."),
        )
            .onError(
              (error, stackTrace) => logger.e("ERROR: $error"),

        );

      },

      onUpgrade: (db,ver,_){},
    );

  }

  Future<List<Student>> getAllStudents() async {

    String query = "SELECT * FROM $studTable";

    List<Map> allData = await database.rawQuery(query);

    logger.i(allData);

    List<Student> allStudents = allData.map((e) => Student.fromMap(Data: e)).toList();

    return allStudents;


  }

  Future<int>insertStudent({required Student student}) async {

    return await database.insert(studTable, student.toMap);
  }




}
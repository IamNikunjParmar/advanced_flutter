import 'dart:developer';

import 'package:budget_tracker_app/Helper/db_helper.dart';
import 'package:get/get.dart';

import '../Modals/student_modal.dart';



class DbController extends GetxController {

  RxList<Student> allStudent = <Student>[].obs;


  DbController(){

    init();
  }





  init() async {

    allStudent(await DbHelper.dbHelper.getAllStudents());

  }

  insert({required Student student})async {

    int res = await (DbHelper.dbHelper.insertStudent(student: student)

    ..then((value) => init(),

    ));

    log("Res: $res");

  }


}
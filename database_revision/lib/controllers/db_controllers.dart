import 'package:database_revision/helper/db_helper.dart';
import 'package:database_revision/modal/emp_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DbController extends ChangeNotifier {
  List<Employee> allData = [];

  DbController() {
    init();
  }

  Future<void> init() async {
    allData = await DbHelper.dbHelper.getData();
    notifyListeners();
  }

  updateEmp({required Employee employee}) async {
    await DbHelper.dbHelper
        .updateDb(employee: employee)
        .then((value) => init());
    notifyListeners();
  }

  addEmp({required Employee employee}) async {
    await DbHelper.dbHelper
        .insertDb(employee: employee)
        .then((value) => init());
    notifyListeners();
  }

  deleteStudent({required Employee employee}) async {
    await DbHelper.dbHelper.deleteDb(id: employee.id).then(
          (value) => init(),
        );
    notifyListeners();
  }
}

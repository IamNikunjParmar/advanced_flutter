import 'package:database_revision/controllers/db_controllers.dart';
import 'package:database_revision/helper/db_helper.dart';
import 'package:database_revision/modal/emp_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<DbController>(builder: (context, pro, _) {
          return ListView.builder(
              itemCount: pro.allData.length,
              itemBuilder: (context, index) {
                Employee employee = pro.allData[index];

                return ExpansionTile(
                  leading: Text(employee.id.toString()),
                  title: Text(employee.name),
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        employee.name = "new name";
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Edit student"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  initialValue: employee.name,
                                  onChanged: (val) => employee.name = val,
                                ),
                              ],
                            ),
                            actions: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  pro.updateEmp(employee: employee).then(
                                        (value) => Navigator.pop(context),
                                      );
                                },
                                child: const Text("Add"),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text("Update"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pro.deleteStudent(employee: employee);
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                );
              });
        }),
      ),
      floatingActionButton: Consumer<DbController>(builder: (context, pro, _) {
        return FloatingActionButton(
          onPressed: () {
            Employee employee = Employee(1, 'demo');
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Add student"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (val) => employee.name = val,
                    ),
                  ],
                ),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pro.addEmp(employee: employee).then(
                            (value) => Navigator.pop(context),
                          );
                    },
                    child: const Text("Add"),
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}

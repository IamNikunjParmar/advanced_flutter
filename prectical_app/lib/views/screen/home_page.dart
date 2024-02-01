import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prectical_app/helper/fb_helper.dart';
import 'package:prectical_app/modal/fb_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyModal modal = MyModal(101, "Nikunj");

          FbHelper.fbHelper.addUser(myModal: modal);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: FbHelper.fbHelper.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot? snaps = snapshot.data;
              List<QueryDocumentSnapshot> data = snaps?.docs ?? [];
              List<MyModal> allUser = data
                  .map((e) => MyModal.fromMap(data: e.data() as Map))
                  .toList();

              return ListView.builder(
                  itemCount: allUser.length,
                  itemBuilder: (context, index) {
                    MyModal modal = allUser[index];

                    return Card(
                      child: ExpansionTile(
                        leading: Text(modal.id.toString()),
                        title: Text(modal.title),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Add User"),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  onSubmitted: (val) {
                                                    modal.id = val as int;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Enter id',
                                                  ),
                                                ),
                                                TextField(
                                                  onSubmitted: (val) {
                                                    modal.title = val;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Enter title',
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                    FbHelper.fbHelper
                                        .updateUser(myModal: modal);
                                  },
                                  child: const Icon(Icons.edit)),
                              ElevatedButton(
                                  onPressed: () {
                                    FbHelper.fbHelper
                                        .deleteUser(myModal: modal);
                                  },
                                  child: const Icon(Icons.delete)),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

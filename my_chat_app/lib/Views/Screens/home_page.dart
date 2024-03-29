import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_chat_app/Helper/firebase_helper.dart';

import '../../Helper/fb_helper.dart';
import '../../Modal/chat_modal.dart';
import '../../Modal/user_modal.dart';
import '../../Utils/my_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  User? user = FbHelper.fbHelper.firebaseAuth.currentUser;

  @override
  Widget build(BuildContext context) {
    UserModal usr;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: CupertinoColors.activeBlue,
              ),
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                  user?.photoURL ??
                      "https://cdn4.iconfinder.com/data/icons/ionicons/512/icon-ios7-contact-512.png",
                ),
              ),
              accountEmail: Text(user?.email ?? " email not found"),
              accountName: Text(user?.displayName ?? "Unknown"),
            ),
            IconButton(
              onPressed: () async {
                FbHelper.fbHelper.logoutUser().then((value) =>
                    Navigator.of(context).pushReplacementNamed(MyRoutes.login));
              },
              icon: const Icon(Icons.logout_rounded),
              iconSize: 35,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
              height: 400,
              child: StreamBuilder(
                stream: FireStoreHelper.fireStoreHelper.getdata(),
                builder: (context, snp) {
                  if (snp.hasData) {
                    QuerySnapshot? snaps = snp.data;

                    List<QueryDocumentSnapshot> docs = snaps?.docs ?? [];

                    List<UserModal> alluser = docs
                        .map((e) => UserModal.fromMap(data: e.data() as Map))
                        .toList();

                    alluser
                        .removeWhere((element) => element.email == user!.email);

                    log("DATA ::::::: $alluser");

                    return ListView.separated(
                      padding: const EdgeInsets.all(10),
                      itemCount: alluser.length,
                      itemBuilder: (context, index) {
                        usr = alluser[index];
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.amber),
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue)),
                                          onPressed: () {
                                            log(usr.email);
                                            log("SENDER>>>>>>>${FbHelper.fbHelper.firebaseAuth.currentUser!.email.toString()}");
                                            FireStoreHelper.fireStoreHelper
                                                .addContact(
                                                    receiver: usr.email,
                                                    sender:
                                                        user!.email as String)
                                                .then((value) =>
                                                    Navigator.of(context)
                                                        .pop());
                                          },
                                          child: const Text("Done")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                    backgroundColor: Colors.yellow,
                                    title: Text("* CONFIRM ADD USER *",
                                        style: TextStyle(color: Colors.red)),
                                  );
                                });
                          },
                          child: Card(
                            child: ListTile(
                              textColor: Colors.white,
                              leading: CircleAvatar(
                                foregroundImage: NetworkImage(usr.img),
                              ),
                              title: Text(usr.email),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.blue),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FireStoreHelper.fireStoreHelper
              .getContactList(email: user!.email.toString(), uid: ''),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DocumentSnapshot<Map<String, dynamic>>? snaps =
                  snapshot.data as DocumentSnapshot<Map<String, dynamic>>?;

              Map<String, dynamic>? data = snaps?.data();

              List contacts = data?['contact'] ?? [];

              return contacts.isNotEmpty
                  ? ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return StreamBuilder(
                          stream: FireStoreHelper.fireStoreHelper
                              .getUserByEmail(email: contacts[index]),
                          builder: (context, snapshot1) {
                            if (snapshot1.hasData) {
                              DocumentSnapshot? docs = snapshot1.data;

                              UserModal usermodal =
                                  UserModal.fromMap(data: docs!.data() as Map);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('chat', arguments: usermodal);
                                },
                                child: Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        foregroundImage: NetworkImage(
                                      usermodal.img,
                                    )),
                                    title: Text(usermodal.username,
                                        style: TextStyle()),
                                    subtitle: StreamBuilder(
                                      stream: FireStoreHelper.fireStoreHelper
                                          .getLastMsg(
                                              senderEmail: FbHelper
                                                  .fbHelper
                                                  .firebaseAuth
                                                  .currentUser!
                                                  .email
                                                  .toString(),
                                              receiverEmail: usermodal.email),
                                      builder: (context, snapshot3) {
                                        if (snapshot3.hasData) {
                                          DocumentSnapshot<
                                                  Map<String, dynamic>>? data =
                                              snapshot3.data;

                                          Map<String, dynamic>? data2 =
                                              data!.data();

                                          if (data2 != null) {
                                            ChatModal chat = ChatModal.fromMap(
                                              data: data2,
                                            );

                                            return Text(
                                              chat.msj,
                                              style: TextStyle(),
                                            );
                                          } else {
                                            return Text(
                                              "Tap and chat",
                                              style: TextStyle(),
                                            );
                                          }
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                    trailing: StreamBuilder(
                                      stream: FireStoreHelper.fireStoreHelper
                                          .getLastMsg(
                                              senderEmail: FbHelper
                                                  .fbHelper
                                                  .firebaseAuth
                                                  .currentUser!
                                                  .email
                                                  .toString(),
                                              receiverEmail: usermodal.email),
                                      builder: (context, snapshot3) {
                                        if (snapshot3.hasData) {
                                          DocumentSnapshot<
                                                  Map<String, dynamic>>? data =
                                              snapshot3.data;

                                          Map<String, dynamic>? data2 =
                                              data!.data();

                                          if (data2 != null) {
                                            ChatModal chat = ChatModal.fromMap(
                                              data: data2,
                                            );

                                            return Text(
                                              "${chat.time.hour % 12} : ${chat.time.minute}",
                                              style: const TextStyle(),
                                            );
                                          } else {
                                            return const Text(
                                              "",
                                              style: TextStyle(
                                                color: Colors.black54,
                                              ),
                                            );
                                          }
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      },
                    )
                  : Container();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
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

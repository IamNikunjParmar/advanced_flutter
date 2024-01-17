import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import '../Modal/chat_modal.dart';
import '../Modal/user_modal.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  String collectionPath = "UserData";
  String lM = "lastMsg";

  adduser({required UserModal user}) {
    fireStore.collection(collectionPath).doc(user.email).set(user.toMap);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getdata() {
    return fireStore.collection(collectionPath).snapshots();
  }

  Future<List> getContactData({required String email}) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await fireStore.collection(collectionPath).doc(email).get();

    Map data = snapshot.data() as Map;

    return data['contact'] ?? [];
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getContactList(
      {required String email, required String uid}) {
    return fireStore.collection(collectionPath).doc(email).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserByEmail(
      {required String email}) {
    return fireStore.collection(collectionPath).doc(email).snapshots();
  }

  Future<void> addContact(
      {required String receiver, required String sender}) async {
    List contacts = await getContactData(email: sender);

    if (!contacts.contains(receiver)) {
      contacts.add(receiver);
      fireStore
          .collection(collectionPath)
          .doc(sender)
          .update({'contact': contacts});
    }

    contacts = await getContactData(email: receiver);
    if (!contacts.contains(sender)) {
      contacts.add(sender);
      fireStore
          .collection(collectionPath)
          .doc(receiver)
          .update({'contact': contacts});
    }
  }

  messageSend(
      {required ChatModal chat,
      required String sender,
      required String receiver}) {
    Map<String, dynamic> data = chat.toMap;

    data.update("type", (value) => "sent");

    fireStore
        .collection(collectionPath)
        .doc(sender)
        .collection(receiver)
        .doc("allchat")
        .collection("chatdata")
        .doc(chat.time.millisecondsSinceEpoch.toString())
        .set(data);

    data.update("type", (value) => "receive");

    fireStore
        .collection(collectionPath)
        .doc(receiver)
        .collection(sender)
        .doc("allchat")
        .collection("chatdata")
        .doc(chat.time.millisecondsSinceEpoch.toString())
        .set(data);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getmessage(
      {required String senderemail, required String recieveremail}) {
    Logger loigger = Logger();

    loigger.i("Sender email : $senderemail // Reciever email:$recieveremail");
    return fireStore
        .collection(collectionPath)
        .doc(senderemail)
        .collection(recieveremail)
        .doc("allchat")
        .collection("chatdata")
        .snapshots();
  }

  setLastMsg({
    required ChatModal chatModal,
    required String senderEmail,
    required String receiverEmail,
  }) {
    Map<String, dynamic> chat = chatModal.toMap;

    chat.update("type", (value) => "sent");

    fireStore
        .collection(collectionPath)
        .doc(senderEmail)
        .collection(receiverEmail)
        .doc(lM)
        .set(chat);

    chat.update("type", (value) => "receive");

    fireStore
        .collection(collectionPath)
        .doc(receiverEmail)
        .collection(senderEmail)
        .doc(lM)
        .set(chat);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getLastMsg({
    required String senderEmail,
    required String receiverEmail,
  }) {
    return fireStore
        .collection(collectionPath)
        .doc(senderEmail)
        .collection(receiverEmail)
        .doc(lM)
        .snapshots();
  }

  Future<void> deleteMsg({
    required ChatModal chatModal,
    required String senderEmail,
    required String receiverEmail,
  }) async {
    Map<String, dynamic> chat = chatModal.toMap;

    chat.update("type", (value) => "sent");
    chat.update("msg", (value) => "This message was deleted");

    await fireStore
        .collection(collectionPath)
        .doc(senderEmail)
        .collection(receiverEmail)
        .doc("allChats")
        .collection("chatData")
        .doc(chatModal.time.millisecondsSinceEpoch.toString())
        .update(chat);
  }
}

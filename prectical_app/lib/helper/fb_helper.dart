import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prectical_app/modal/fb_modal.dart';

class FbHelper {
  FbHelper._();
  static final FbHelper fbHelper = FbHelper._();

  String collectionPath = "UserData";

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getUser() {
    return fireStore.collection(collectionPath).snapshots();
  }

  addUser({required MyModal myModal}) {
    fireStore
        .collection(collectionPath)
        .doc(myModal.id.toString())
        .set(myModal.toMap);
  }

  updateUser({required MyModal myModal}) {
    fireStore
        .collection(collectionPath)
        .doc(myModal.id.toString())
        .update(myModal.toMap);
  }

  deleteUser({required MyModal myModal}) {
    fireStore.collection(collectionPath).doc(myModal.id.toString()).delete();
  }
}

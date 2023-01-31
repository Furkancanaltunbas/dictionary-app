


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_word/core/model/model.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final firebaseUser = FirebaseAuth.instance.currentUser;







  Future<Kelimeler> addStatus(
      String turkce, String ingilizce, bool durum) async {
    var ref = _firestore
        .collection("Person")
        .doc(firebaseUser?.uid)
        .collection("Kelimeler");

    durum = false;

    var documentRef = await ref.add({
      "turkce": turkce,
      "ingilizce": ingilizce,
      "durum": durum,
    });

    return Kelimeler(
        id: documentRef.id, turkce: turkce, ingilizce: ingilizce, durum: durum);
  }

  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore
        .collection("Person")
        .doc(firebaseUser?.uid)
        .collection("Kelimeler")
        .snapshots();

    return ref;
  }

  Future<void> removeStatus(String docId) {
    var ref = _firestore
        .collection("Person")
        .doc(firebaseUser?.uid)
        .collection("Kelimeler")
        .doc(docId)
        .delete();

    return ref;
  }










}

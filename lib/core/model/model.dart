import 'package:cloud_firestore/cloud_firestore.dart';

class Kelimeler {
  String id;
  String turkce;
  String ingilizce;
  bool durum;

  Kelimeler({required this.id,
    required this.turkce,
    required this.ingilizce,
    required this.durum});

  factory Kelimeler.fromSnapshot(DocumentSnapshot snapshot) {
    return Kelimeler(
        id: snapshot.id,
        turkce: snapshot["turkce"],
        ingilizce: snapshot["ingilizce"],
        durum: snapshot["durum"]);
  }

}

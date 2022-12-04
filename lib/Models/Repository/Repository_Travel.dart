import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RepositoryTravel {
  static final RepositoryTravel _repositoryTravel =
      RepositoryTravel._internal();

  RepositoryTravel._internal();

  factory RepositoryTravel() {
    return _repositoryTravel;
  }
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Travel>> getTravel() {
    return _db.collection("products").snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Travel.fromMap(doc.data(), doc.id),
              )
              .toList(),
        );
  }

  Future<void> updateTravel(Travel travel) {
    return _db.collection('products').doc(travel.id).update(travel.toMap());
  }

  Future<void> deleteTravel(String id) {
    return _db.collection('products').doc(id).delete();
  }

  Future<void> addNote(Travel travel) {
    return _db.collection('products').add(travel.toMap());
  }
}

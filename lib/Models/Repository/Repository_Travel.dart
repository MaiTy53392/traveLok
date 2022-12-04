import 'package:travelok_vietnam_app/Models/Repository/Repository.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RepositoryTravel implements Repository {
  String dataUrl = 'https://637dbee59c2635df8f8d954f.mockapi.io/api';
  final productsRef = FirebaseFirestore.instance.collection("products");
  @override
  Future<List<Travel>> getTravel() async {
    List<Travel> travelList = [];
    await productsRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
        travelList.add(Travel.fromJson(map));
      });
    });
    return travelList;
  }

  @override
  Future<String> patchCompleted(Travel travel) {
    throw UnimplementedError();
  }

  @override
  Future<String> putCompleted(Travel travel) {
    // TODO: implement putCompleted
    throw UnimplementedError();
  }

  @override
  Future<String> deleteTravel(Travel travel) {
    // TODO: implement deleteTravel
    throw UnimplementedError();
  }

  @override
  Future<String> postTravel(Travel travel) {
    // TODO: implement postTravel
    throw UnimplementedError();
  }
}

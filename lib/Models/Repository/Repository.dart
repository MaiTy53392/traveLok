import 'package:travelok_vietnam_app/Models/Station_Travel.dart';

abstract class Repository {
  Future<List<Travel>> getTravel(); // GET
  Future<String> patchCompleted(Travel travel); // PATCH
  Future<String> putCompleted(Travel travel); // PUT
  Future<String> deleteTravel(Travel travel); //DELETE
  Future<String> postTravel(Travel travel); //POST
}
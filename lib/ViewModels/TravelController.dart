import 'package:travelok_vietnam_app/Models/Repository/Repository.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';

class TravelController {
  final Repository _repository;
  TravelController(this._repository);

  // GET TRAVEL
  Future<List<Travel>> fetchTravel() async {
    return _repository.getTravel();
  }

}
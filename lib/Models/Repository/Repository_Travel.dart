import 'package:travelok_vietnam_app/Models/Repository/Repository.dart';
import 'package:travelok_vietnam_app/Models/Station_Travel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepositoryTravel implements Repository {
  String dataUrl = 'https://637dbee59c2635df8f8d954f.mockapi.io/api';

  @override
  Future<List<Travel>> getTravel() async {
    // TODO: implement getTravel
    List<Travel> travelList = []; // Array Empty
    var url = Uri.parse('$dataUrl/travels'); // Url
    var response = await http.get(url); // Http
    print('Status Code: ${response.statusCode}'); // Print Status
    var body = json.decode(response.body); // Convert
    // Parse
    for (var i = 0; i < body.length; i++) {
      travelList.add(Travel.fromJson(body[i]));
    }
    return travelList;
  }

  @override
  Future<String> patchCompleted(Travel travel) {
    // TODO: implement patchCompleted
    // // PATCH Chỉ sửa đổi các biến đã truyền
    // var url = Uri.parse('$dataUrl/travels/${travel.id}'); // Url
    // // Callback Data
    // String resData = '';
    // // Bool? -> String
    // await http.patch(
    //   url,
    //   body: {
    //     'Completed': (travel.title).toString(),
    //   },
    //   headers: {'Authorization': 'your_token'},
    // ).then((response) {
    //   // Home -> Data
    //   Map<String, dynamic> result = json.decode(response.body);
    //   print(result);
    //   return resData = result[''];
    // });
    // return resData;
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

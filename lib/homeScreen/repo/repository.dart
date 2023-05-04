// ignore_for_file: require_trailing_commas

import 'dart:convert';
import 'package:foodieapp/homeScreen/view/model/demo_model.dart';

import 'package:http/http.dart';

class DemoRepository {
  String endpoint =
      'https://food-delivery-app-5ff8c-default-rtdb.firebaseio.com/post.json';
  Future<FoodDemoModel> demoUser() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.body);
//  return demoModelFromJson(response.body );
// final body=jsonDecode(response.body);
// print(body);
      return FoodDemoModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    } else {
      // print('errrr');
      throw Exception(response.reasonPhrase);
    }
  }
}

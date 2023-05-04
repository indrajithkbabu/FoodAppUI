import 'dart:convert';

import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
import 'package:http/http.dart';

class RecommendedDishesRepository {
  String endpoint =
      'https://food-delivery-app-5ff8c-default-rtdb.firebaseio.com/recommendeddish.json';
  Future<RecommendedDishesModel> recommendedDishData() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.body);
//  return demoModelFromJson(response.body );
// final body=jsonDecode(response.body);
// print(body);
      return RecommendedDishesModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>,);
    } else {
      //  print('errrr');
      throw Exception(response.reasonPhrase);
    }
  }
}

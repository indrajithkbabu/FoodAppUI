import 'dart:convert';

import 'package:foodieapp/homeScreen/view/model/transaction_model.dart';
import 'package:http/http.dart';

class TransactionRepository {
  String endpoint =
      'https://food-delivery-app-5ff8c-default-rtdb.firebaseio.com/transaction.json';
  Future<TransactionModel> transactionData() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200 || response.statusCode == 201) {
        // print(response.body);
//  return demoModelFromJson(response.body );
// final body=jsonDecode(response.body);
// print(body);
      return TransactionModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>,);
    } else {
      //  print('errrr');
      throw Exception(response.reasonPhrase);
    }
  }
}

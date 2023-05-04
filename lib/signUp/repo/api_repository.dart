// ignore_for_file: noop_primitive_operations, avoid_dynamic_calls

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

class SignUpApiRepo {
  Future<dynamic> apiSignUp({
    required String email,
    required String password,
    required String username,
    // required BuildContext context,
  }) async {
    const url = 'https://food-delivery-rv21.onrender.com/api/user';

    try {
      final response = await post(
        Uri.parse(url),
        body: {'email': email, 'password': password, 'name': username},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = jsonDecode(response.body.toString());
        // print(res['message']);
        //  Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ScreenLogin(),
        //     ));

        return Fluttertoast.showToast(msg: '${res["message"]}');
      } else {
        final res = jsonDecode(response.body);

        return Fluttertoast.showToast(msg: '${res["message"]}');
      }
    } catch (e) {
      await Fluttertoast.showToast(msg: e.toString());
    }
  }
}

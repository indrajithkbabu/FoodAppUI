// ignore_for_file: omit_local_variable_types, avoid_dynamic_calls, noop_primitive_operations, use_build_context_synchronously, inference_failure_on_instance_creation

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:http/http.dart';

class ApiLoginRepo {
  Future<dynamic> apiLogin({
    required String email,
    required String password,
     required BuildContext context,
  }) async {
    const url = 'https://food-delivery-rv21.onrender.com/api/user/login';

    try {
      final response = await post(
        Uri.parse(url),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = jsonDecode(response.body.toString());
       final String sharedToken = res['user']['accessToken'].toString();
        // print("login respnse token");
        // print(sharedToken);
        saveToken(sharedToken);

         Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenHome(),
            ),);
        // print(res['user']['accessToken']);
        // print('Logged IN successfully');
        // return res["message"];
        return Fluttertoast.showToast(msg: '${res["message"]}');
      } else {
        final res = jsonDecode(response.body);
        // print(res['message']);

        return Fluttertoast.showToast(msg: '${res["message"]}');
        //  res['message'].toString();
        //  print(response.statusCode);
        // throw Exception('Request Error: ${response.body}');
      }
    } catch (e) {
       await Fluttertoast.showToast(msg: e.toString());
     
    }
  }
}

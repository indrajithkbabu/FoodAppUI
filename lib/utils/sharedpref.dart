// ignore_for_file: use_build_context_synchronously, inference_failure_on_instance_creation, lines_longer_than_80_chars, unawaited_futures, inference_failure_on_function_return_type

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';



import 'package:shared_preferences/shared_preferences.dart';

//shared pref -token

saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
//  print(token);
 prefs.setString('token', token);
  debugPrint('saveToke');
 debugPrint(token);
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
final tokenFetched= prefs.getString('token');
 debugPrint('gettoken');
 debugPrint(tokenFetched);
  return tokenFetched;
 
}

Future<void>clearToken({required BuildContext context})async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 prefs.remove('token');
  // Navigator.push(context,MaterialPageRoute(builder: (context) => ScreenLogin(),));
  
}

//shared pref - notification

// setNotification(String notificationKey,bool value)async{
// final SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setBool(notificationKey, value);
// print(prefs.setBool(notificationKey, value));
// }
// Future<bool?>getNotification(String notificationKey)async{
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final notificationFetched= prefs.getBool(notificationKey);
//   print(notificationFetched);
//   return notificationFetched;
// }
Future<List<XploreResto>> getFavorites() async {
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList('favKey') ?? [];
// final List favData=XploreResto.fromJson(favorites);
final fav = favorites.map((e) => XploreResto.fromJson(jsonDecode(e) as Map<String,dynamic>)).toList();
    print(favorites);
    return fav;
  }

// To parse this JSON data, do
//
//     final apiSignUpModel = apiSignUpModelFromJson(jsonString);

// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars, duplicate_ignore


import 'dart:convert';

ApiSignUpModel apiSignUpModelFromJson(String str) => ApiSignUpModel.fromJson(json.decode(str)as Map<String, dynamic>);

String apiSignUpModelToJson(ApiSignUpModel data) => json.encode(data.toJson());

class ApiSignUpModel {
    ApiSignUpModel({
        required this.code,
        required this.status,
        required this.message,
    });

    int code;
    String status;
    String message;


    factory ApiSignUpModel.fromJson(Map<String, dynamic> json) => ApiSignUpModel(
        code: json['code'] as int,
        status: json['status'] as String,
        message: json['message'] as String,
    );

    Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'message': message,
    };
}

// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first, avoid_dynamic_calls


import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str)as Map<String, dynamic>);

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
    TransactionModel({
        required this.nSkBGd6BamSnTv4L0U,
    });

    NSkBGd6BamSnTv4L0U nSkBGd6BamSnTv4L0U;

    factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        nSkBGd6BamSnTv4L0U: NSkBGd6BamSnTv4L0U.fromJson(json['-NSkB-gd6BamSnTv4l0U']as Map<String, dynamic>),
    );

    Map<String, dynamic> toJson() => {
        '-NSkB-gd6BamSnTv4l0U': nSkBGd6BamSnTv4L0U.toJson(),
    };
}

class NSkBGd6BamSnTv4L0U {
    NSkBGd6BamSnTv4L0U({
        required this.date1,
        required this.date2,
        required this.day1,
        required this.day2,
    });

    String date1;
    String date2;
    List<Day> day1;
    List<Day> day2;

    factory NSkBGd6BamSnTv4L0U.fromJson(dynamic json) => NSkBGd6BamSnTv4L0U(
        date1: json['date_1']as String,
        date2: json['date_2']as String,
        day1: List<Day>.from((json['day_1']as List).map((x) => Day.fromJson(x as dynamic))),
        day2: List<Day>.from((json['day_2']as List).map((x) => Day.fromJson(x as dynamic))),
    );

    Map<String, dynamic> toJson() => {
        'date_1': date1,
        'date_2': date2,
        'day_1': List<dynamic>.from(day1.map((x) => x.toJson())),
        'day_2': List<dynamic>.from(day2.map((x) => x.toJson())),
    };
}

class Day {
    Day({
        required this.bank,
        required this.content,
        required this.id,
        required this.rate,
        required this.time,
    });

    String bank;
    String content;
    int id;
    int rate;
   String time;

    factory Day.fromJson(dynamic json) => Day(
        bank: json['bank']as String,
        content: json['content']as String,
        id: json['id']as int,
        rate: json['rate']as int,
        time: json['time']as String,
    );

    Map<String, dynamic> toJson() => {
        'bank': bank,
        'content': content,
        'id': id,
        'rate': rate,
        'time': time,
    };
}

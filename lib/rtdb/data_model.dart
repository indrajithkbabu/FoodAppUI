// ignore_for_file: lines_longer_than_80_chars
// // To parse this JSON data, do
// //
// //     final rtdbDemoModel = rtdbDemoModelFromJson(jsonString);

// // ignore_for_file: sort_constructors_first, avoid_dynamic_calls, lines_longer_than_80_chars


// import 'dart:convert';

// RtdbDemoModel rtdbDemoModelFromJson(String str) => RtdbDemoModel.fromJson(json.decode(str));

// String rtdbDemoModelToJson(RtdbDemoModel data) => json.encode(data.toJson());

// class RtdbDemoModel {
//     RtdbDemoModel({
//         required this.nRaVoQe73HYhDhJpzUb,
//     });

//     NRaVoQe73HYhDhJpzUb nRaVoQe73HYhDhJpzUb;

//     factory RtdbDemoModel.fromJson(dynamic json) => RtdbDemoModel(
//         nRaVoQe73HYhDhJpzUb: NRaVoQe73HYhDhJpzUb.fromJson(json['-NRaVoQE73hYhDhJpzUB']as Map<String,dynamic>),
//     );

//     Map<String, dynamic> toJson() => {
//         '-NRaVoQE73hYhDhJpzUB': nRaVoQe73HYhDhJpzUb.toJson(),
//     };
// }

// class NRaVoQe73HYhDhJpzUb {
//     NRaVoQe73HYhDhJpzUb({
//         required this.banners,
//         required this.foodBanners,
//         required this.hotelCount,
//         required this.xploreResto,
//     });

//     List<Banner> banners;
//     List<FoodBanner> foodBanners;
//     int hotelCount;
//     List<XploreResto> xploreResto;

//     factory NRaVoQe73HYhDhJpzUb.fromJson(dynamic json) => NRaVoQe73HYhDhJpzUb(
//         banners: List<Banner>.from((json['banners']as List).map((x) => Banner.fromJson(x  as dynamic))),
//         foodBanners: List<FoodBanner>.from((json['foodBanners']as List).map((x) => FoodBanner.fromJson(x  as dynamic))),
//         hotelCount: json['hotel_count']as int,
//         xploreResto: List<XploreResto>.from((json['xploreResto']as List).map((x) => XploreResto.fromJson(x  as dynamic))),
//     );

//     Map<String, dynamic> toJson() => {
//         'banners': List<dynamic>.from(banners.map((x) => x.toJson())),
//         'foodBanners': List<dynamic>.from(foodBanners.map((x) => x.toJson())),
//         'hotel_count': hotelCount,
//         'xploreResto': List<dynamic>.from(xploreResto.map((x) => x.toJson())),
//     };
// }

// class Banner {
//     Banner({
//         required this.id,
//         required this.image,
//     });

//     int id;
//     String image;

//     factory Banner.fromJson(dynamic json) => Banner(
//         id: json['id']as int,
//         image: json['image']as String,
//     );

//     Map<String, dynamic> toJson() => {
//         'id': id,
//         'image': image,
//     };
// }

// class FoodBanner {
//     FoodBanner({
//         required this.foodname,
//         required this.id,
//         required this.image,
//     });

//     String foodname;
//     int id;
//     String image;

//     factory FoodBanner.fromJson(dynamic json) => FoodBanner(
//         foodname: json['foodname']as String,
//         id: json['id']as int,
//         image: json['image']as String,
//     );

//     Map<String, dynamic> toJson() => {
//         'foodname': foodname,
//         'id': id,
//         'image': image,
//     };
// }

// class XploreResto {
//     XploreResto({
//         required this.distance,
//         required this.hotel,
//         required this.id,
//         required this.image,
//         required this.off,
//         required this.place,
//         required this.rating,
//         required this.time,
//     });

//     int distance;
//     String hotel;
//     int id;
//     String image;
//     int off;
//     String place;
//     double rating;
//     int time;

//     factory XploreResto.fromJson(dynamic json) => XploreResto(
//         distance: json['distance']as int,
//         hotel: json['hotel']as String,
//         id: json['id']as int,
//         image: json['image']as String,
//         off: json['off']as int,
//         place: json['place']as String,
//         rating: json['rating']as double,
//         time: json['time']as int,
//     );

//     Map<String, dynamic> toJson() => {
//         'distance': distance,
//         'hotel': hotel,
//         'id': id,
//         'image': image,
//         'off': off,
//         'place': place,
//         'rating': rating,
//         'time': time,
//     };
// }

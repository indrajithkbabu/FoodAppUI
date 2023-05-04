
// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first

import 'dart:convert';

HomeApiModel homeApiModelFromJson(String str) => HomeApiModel.fromJson(json.decode(str)as Map<String, dynamic>);

String homeApiModelToJson(HomeApiModel data) => json.encode(data.toJson());

class HomeApiModel {
    HomeApiModel({
        required this.code,
        required this.message,
        required this.data,
    });

    int code;
    String message;
    Data data;

    factory HomeApiModel.fromJson(Map<String, dynamic> json) => HomeApiModel(
        code: json['code']as int,
        message: json['message']as String,
        data: Data.fromJson(json['data']as Map<String, dynamic>),
    );

    Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.toJson(),
    };
}

class Data {
    Data({
        required this.nrWifmDJwiwH8WwvlhV,
    });

    NrWifmDJwiwH8WwvlhV nrWifmDJwiwH8WwvlhV;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        nrWifmDJwiwH8WwvlhV: NrWifmDJwiwH8WwvlhV.fromJson(json['-NRWifmDJwiwH8wwvlhV']as Map<String,dynamic>),
    );

    Map<String, dynamic> toJson() => {
        '-NRWifmDJwiwH8wwvlhV': nrWifmDJwiwH8WwvlhV.toJson(),
    };
}

class NrWifmDJwiwH8WwvlhV {
    NrWifmDJwiwH8WwvlhV({
        required this.banners,
        required this.foodBanners,
        required this.hotelCount,
        required this.xploreResto,
    });

    List<Banner> banners;
    List<FoodBanner> foodBanners;
    int hotelCount;
    List<XploreResto> xploreResto;

    factory NrWifmDJwiwH8WwvlhV.fromJson(Map<String, dynamic> json) => NrWifmDJwiwH8WwvlhV(
        banners: List<Banner>.from((json['banners']as List).map((x) => Banner.fromJson(x as Map<String,dynamic>))),
        foodBanners: List<FoodBanner>.from((json['foodBanners']as List).map((x ) => FoodBanner.fromJson(x as Map<String,dynamic>))),
        hotelCount: json['hotel_count']as int,
        xploreResto: List<XploreResto>.from((json['xploreResto']as List).map((x) => XploreResto.fromJson(x as Map<String,dynamic>))),
    );

    Map<String, dynamic> toJson() => {
        'banners': List<dynamic>.from(banners.map((x) => x.toJson())),
        'foodBanners': List<dynamic>.from(foodBanners.map((x) => x.toJson())),
        'hotel_count': hotelCount,
        'xploreResto': List<dynamic>.from(xploreResto.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.id,
        required this.image,
    });

    int id;
    String image;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json['id']as int,
        image: json['image']as String,
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
    };
}

class FoodBanner {
    FoodBanner({
        required this.foodname,
        required this.id,
        required this.image,
    });

    String foodname;
    int id;
    String image;

    factory FoodBanner.fromJson(Map<String, dynamic> json) => FoodBanner(
        foodname: json['foodname']as String,
        id: json['id']as int,
        image: json['image']as String,
    );

    Map<String, dynamic> toJson() => {
        'foodname': foodname,
        'id': id,
        'image': image,
    };
}

class XploreResto {
    XploreResto({
        required this.distance,
        required this.hotel,
        required this.id,
        required this.image,
        required this.off,
        required this.place,
        required this.rating,
        required this.time,
    });

    int distance;
    String hotel;
    int id;
    String image;
    int off;
    String place;
    double rating;
    int time;

    factory XploreResto.fromJson(Map<String, dynamic> json) => XploreResto(
        distance: json['distance']as int,
        hotel: json['hotel']as String,
        id: json['id']as int,
        image: json['image']as String,
        off: json['off']as int,
        place: json['place']as String,
        rating: json['rating']as double,
        time: json['time']as int,
    );

    Map<String, dynamic> toJson() => {
        'distance': distance,
        'hotel': hotel,
        'id': id,
        'image': image,
        'off': off,
        'place': place,
        'rating': rating,
        'time': time,
    };
}

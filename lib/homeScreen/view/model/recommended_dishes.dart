// To parse this JSON data, do
//
//     final recommendedDishesModel = recommendedDishesModelFromJson(jsonString);


// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first, avoid_dynamic_calls

import 'dart:convert';

RecommendedDishesModel recommendedDishesModelFromJson(String str) => RecommendedDishesModel.fromJson(json.decode(str)as Map<String, dynamic>);

String recommendedDishesModelToJson(RecommendedDishesModel data) => json.encode(data.toJson());

class RecommendedDishesModel {
    RecommendedDishesModel({
        required this.nSu2QkNjNeKiuv3YX,
    });

    NSu2QkNjNeKiuv3YX nSu2QkNjNeKiuv3YX;

    factory RecommendedDishesModel.fromJson(Map<String, dynamic> json) => RecommendedDishesModel(
        nSu2QkNjNeKiuv3YX: NSu2QkNjNeKiuv3YX.fromJson(json['-NSu2Qk_NJNeKiuv3-yX']as Map<String, dynamic>),
    );

    Map<String, dynamic> toJson() => {
        '-NSu2Qk_NJNeKiuv3-yX': nSu2QkNjNeKiuv3YX.toJson(),
    };
}

class NSu2QkNjNeKiuv3YX {
    NSu2QkNjNeKiuv3YX({
        required this.dishDetails,
        required this.recommendedDishes,
    });

    List<DishDetail> dishDetails;
    int recommendedDishes;

    factory NSu2QkNjNeKiuv3YX.fromJson(dynamic json) => NSu2QkNjNeKiuv3YX(
        dishDetails: List<DishDetail>.from((json['dish_details']as List).map((x) => DishDetail.fromJson(x as dynamic))),
        recommendedDishes: json['recommended_dishes']as int,
    );

    Map<String, dynamic> toJson() => {
        'dish_details': List<dynamic>.from(dishDetails.map((x) => x.toJson())),
        'recommended_dishes': recommendedDishes,
    };
}

class DishDetail {
    DishDetail({
        required this.content,
        required this.dishName,
        required this.id,
        required this.image,
        required this.price,
        required this.rating,
        required this.vegStatus,
    });

    String content;
    String dishName;
    int id;
    String image;
    int price;
    double rating;
    String vegStatus;

    factory DishDetail.fromJson(dynamic json) => DishDetail(
        content: json['content']as String,
        dishName: json['dish_name']as String,
        id: json['id']as int,
        image: json['image']as String,
        price: json['price']as int,
        rating: json['rating']as double,
        vegStatus: json['veg_status']as String,
    );

    Map<String, dynamic> toJson() => {
        'content': content,
        'dish_name': dishName,
        'id': id,
        'image': image,
        'price': price,
        'rating': rating,
        'veg_status': vegStatus,
    };
}

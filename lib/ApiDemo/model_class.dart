
// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls


import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str)as Map<String, dynamic>);

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
       
    });
    
  

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        page: json['page']as int,
        perPage: json['per_page']as int,
        total: json['total']as int,
        totalPages: json['total_pages']as int,
        data: List<Datum>.from(((json['data'] )as List).map((x) => Datum.fromJson(x as Map<String, dynamic>))),
    
    );

    int page;
    int perPage;
    int total;
    int totalPages;
    List<Datum> data;

    Map<String, dynamic> toJson() => {
        'page': page,
        'per_page': perPage,
        'total': total,
        'total_pages': totalPages,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),

    };
}

class Datum {
    Datum({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory Datum.fromJson(dynamic json) => Datum(
        id: json['id'] as int,
        email: json['email'] as String,
        firstName: json['first_name']as String,
        lastName: json['last_name']as String,
        avatar: json['avatar']as String,
    );

    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;

    Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
    };
}

class Support {
    Support({
        required this.url,
        required this.text,
    });

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json['url']as String,
        text: json['text']as String,
    );

    String url;
    String text;

    Map<String, dynamic> toJson() => {
        'url': url,
        'text': text,
    };
}



// import 'dart:convert';

// FoodDemoModel foodDemoModelFromJson(String str) => FoodDemoModel.fromJson(json.decode(str)as Map<String,dynamic>);

// String foodDemoModelToJson(FoodDemoModel data) => json.encode(data.toJson());

// class FoodDemoModel {
//     FoodDemoModel({
//         required this.nr2VxEfuKw1HWplkxdy,
//     });

//     factory FoodDemoModel.fromJson(dynamic json) => FoodDemoModel(
//         nr2VxEfuKw1HWplkxdy: Nr2VxEfuKw1HWplkxdy.fromJson(json['-NR2VxEfuKw1hWplkxdy']as Map<String,dynamic>),
//     );

//     Nr2VxEfuKw1HWplkxdy nr2VxEfuKw1HWplkxdy;

//     Map<String, dynamic> toJson() => {
//         '-NR2VxEfuKw1hWplkxdy': nr2VxEfuKw1HWplkxdy.toJson(),
//     };
// }

// class Nr2VxEfuKw1HWplkxdy {
//     Nr2VxEfuKw1HWplkxdy({
//         required this.banners,
//         required this.foodBanners,
//         required this.xploreResto,
//     });

//     factory Nr2VxEfuKw1HWplkxdy.fromJson(dynamic json) => Nr2VxEfuKw1HWplkxdy(
//         banners: List<Banners>.from((json['banners']as List).map((x) => Banners.fromJson(x as dynamic))),
//         foodBanners: List<FoodBanner>.from((json['foodBanners']as List).map((x) => FoodBanner.fromJson(x as dynamic))),
//         xploreResto: List<XploreResto>.from((json['xploreResto']as List).map((x) => XploreResto.fromJson(x as dynamic))),
//     );

//     List<Banners> banners;
//     List<FoodBanner> foodBanners;
//     List<XploreResto> xploreResto;

//     Map<String, dynamic> toJson() => {
//         'banners': List<dynamic>.from(banners.map((x) => x.toJson())),
//         'foodBanners': List<dynamic>.from(foodBanners.map((x) => x.toJson())),
//         'xploreResto': List<dynamic>.from(xploreResto.map((x) => x.toJson())),
//     };
// }

// class Banners {
//     Banners({
//         required this.id,
//         required this.image,
//     });

//     factory Banners.fromJson(dynamic json) => Banners(
//         id: json['id'] as int,
//         image: json['image']as String,
//     );

//     int id;
//     String image;

//     Map<String, dynamic> toJson() => {
//         'id': id,
//         'image': image,
//     };
// }
// class XploreResto {
//     XploreResto({
//         required this.id,
//         required this.image,
//         required this.rating,
//         required this.off,
//         required this.hotel,
//         required this.time,
//         required this.place,
//         required this.distance,
//     });

//     factory XploreResto.fromJson(dynamic json) => XploreResto(
//         id: json['id'] as int,
//         image: json['image']as String,
//         rating: json['rating'] as double,
//         off: json['off'] as int,
//         hotel: json['hotel'] as String,
//         time:json['time'] as int,
//         place: json['place'] as String,
//         distance: json['distance']as int,
//     );

//     int id;
//     String image;
//    double rating;
//    int off;
//    String hotel;
//    String place;
//    int time; 
//    int distance;

//     Map<String, dynamic> toJson() => {
//         'id': id,
//         'image': image,
//         'rating':rating,
//         'off':off,
//         'hotel':hotel,
//         'time':time,
//         'place':place,
//         'distance':distance
//     };
// }

// class FoodBanner {
//     FoodBanner({
//         required this.foodname,
//         required this.id,
//         required this.image,
//     });

//     factory FoodBanner.fromJson(dynamic json) => FoodBanner(
//         foodname: json['foodname'] as String,
//         id: json['id']as int,
//         image: json['image']as String,
//     );

//     String foodname;
//     int id;
//     String image;

//     Map<String, dynamic> toJson() => {
//         'foodname': foodname,
//         'id': id,
//         'image': image,
//     };
// }


// // To parse this JSON data, do
// //
// //     final dataModel = dataModelFromJson(jsonString);

// // ignore_for_file: lines_longer_than_80_chars

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<DataModel> dataModelFromJson(String str) => List<DataModel>.from((json.decode(str)as List).map((x) => DataModel.fromJson(x as Map<String, dynamic>)));

// String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class DataModel {
//     DataModel({
//         required this.id,
//         required this.title,
//         // required this.price,
//         required this.description,
//         required this.category,
//         required this.image,
//         required this.rating,
//     });

//     int id;
//     String title;
//     // double price;
//     String description;
//     Category category;
//     String image;
//     Rating rating;

//     factory DataModel.fromJson(dynamic json) => DataModel(
//         id: json['id']as int,
//         title: json['title']as String,
//         // price: json['price']as double,
//         description: json['description']as String,
//         category: categoryValues.map[json['category']]!,
//         image: json['image'] as String,
//         rating: Rating.fromJson(json['rating']as Map<String, dynamic>),
//     );

//     Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         // 'price': price,
//         'description': description,
//         'category': categoryValues.reverse[category],
//         'image': image,
//         'rating': rating.toJson(),
//     };
// }

// enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

// final categoryValues = EnumValues({
//     'electronics': Category.ELECTRONICS,
//     'jewelery': Category.JEWELERY,
//     "men's clothing": Category.MEN_S_CLOTHING,
//     "women's clothing": Category.WOMEN_S_CLOTHING
// });

// class Rating {
//     Rating({
//         // required this.rate,
//         required this.count,
//     });

//     // double rate;
//     int count;

//     factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         // rate: json['rate']as double,
//         count: json['count'] as int,
//     );

//     Map<String, dynamic> toJson() => {
//         // 'rate': rate,
//         'count': count,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }

// ----------------------------------
// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

// import 'dart:ffi';

// import 'package:meta/meta.dart';
// import 'dart:convert';

// DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str ) as Map<String, dynamic>);

// String dataModelToJson(DataModel data) => json.encode(data.toJson());

// class DataModel {
//     DataModel({
//         required this.id,
//         required this.title,
//         required this.price,
//         required this.description,
//         required this.category,
//         required this.image,
//         required this.rating,
//     });

//     int id;
//     String title;
//     double price;
//     String description;
//     String category;
//     String image;
//     Rating rating;

//     factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
//         id: json["id"] as int,
//         title: json["title"]as String,
//         price: json["price"]as double,
//         description: json["description"]as String,
//         category: json["category"]as String,
//         image: json["image"] as String,
//         rating: Rating.fromJson(json["rating"] as Map<String, dynamic>),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category,
//         "image": image,
//         "rating": rating.toJson(),
//     };
// }

// class Rating {
//     Rating({
//         required this.rate,
//         required this.count,
//     });

//     double rate;
//     int count;

//     factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rate: json["rate"]as double,
//         count: json["count"]as int,
//     );

//     Map<String, dynamic> toJson() => {
//         "rate": rate,
//         "count": count,
//     };
// }
// ----------------------------------
// import 'dart:convert';

// DataModel  DataModelFromJson(String str) => DataModel .fromJson(json.decode(str)as Map<String, dynamic>);

// String DataModelToJson(DataModel  data) => json.encode(data.toJson());

// class DataModel {
//   NR2VxEfuKw1hWplkxdy? nR2VxEfuKw1hWplkxdy;

//   DataModel({this.nR2VxEfuKw1hWplkxdy});

//   DataModel.fromJson(Map<String, dynamic> json) {
//     nR2VxEfuKw1hWplkxdy = json['-NR2VxEfuKw1hWplkxdy'] != null
//         ? new NR2VxEfuKw1hWplkxdy.fromJson(json['-NR2VxEfuKw1hWplkxdy']as Map<String, dynamic>)
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.nR2VxEfuKw1hWplkxdy != null) {
//       data['-NR2VxEfuKw1hWplkxdy'] = this.nR2VxEfuKw1hWplkxdy!.toJson();
//     }
//     return data;
//   }
// }

// class NR2VxEfuKw1hWplkxdy {
//   List<Banners>? banners;
//   List<FoodBanners>? foodBanners;
//   List<XploreResto>? xploreResto;

//   NR2VxEfuKw1hWplkxdy({this.banners, this.foodBanners, this.xploreResto});

//   NR2VxEfuKw1hWplkxdy.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       banners = <Banners>[];
//       json['banners'].forEach((v) {
//         banners!.add(new Banners.fromJson(v as Map<String, dynamic>));
//       });
//     }
//     if (json['foodBanners'] != null) {
//       foodBanners = <FoodBanners>[];
//       json['foodBanners'].forEach((v) {
//         foodBanners!.add(new FoodBanners.fromJson(v as Map<String, dynamic>));
//       });
//     }
//     if (json['xploreResto'] != null) {
//       xploreResto = <XploreResto>[];
//       json['xploreResto'].forEach((v) {
//         xploreResto!.add(new XploreResto.fromJson(v as Map<String, dynamic>));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.banners != null) {
//       data['banners'] = this.banners!.map((v) => v.toJson()).toList();
//     }
//     if (this.foodBanners != null) {
//       data['foodBanners'] = this.foodBanners!.map((v) => v.toJson()).toList();
//     }
//     if (this.xploreResto != null) {
//       data['xploreResto'] = this.xploreResto!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Banners {
//   int? id;
//   String? image;

//   Banners({this.id, this.image});

//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'] as int;
//     image = json['image']as String;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image'] = this.image;
//     return data;
//   }
// }

// class FoodBanners {
//   String? foodname;
//   int? id;
//   String? image;

//   FoodBanners({this.foodname, this.id, this.image});

//   FoodBanners.fromJson(Map<String, dynamic> json) {
//     foodname = json['foodname']as String;
//     id = json['id']as int;
//     image = json['image']as String;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['foodname'] = this.foodname;
//     data['id'] = this.id;
//     data['image'] = this.image;
//     return data;
//   }
// }

// class XploreResto {
//   int? distance;
//   String? hotel;
//   int? id;
//   String? image;
//   int? off;
//   String? place;
//   double? rating;
//   int? time;

//   XploreResto(
//       {this.distance,
//       this.hotel,
//       this.id,
//       this.image,
//       this.off,
//       this.place,
//       this.rating,
//       this.time});

//   XploreResto.fromJson(Map<String, dynamic> json) {
//     distance = json['distance'] as int;
//     hotel = json['hotel'] as String;
//     id = json['id']as int;
//     image = json['image']as String;
//     off = json['off']as int;
//     place = json['place']as String;
//     rating = json['rating']as double;
//     time = json['time']as int;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['distance'] = this.distance;
//     data['hotel'] = this.hotel;
//     data['id'] = this.id;
//     data['image'] = this.image;
//     data['off'] = this.off;
//     data['place'] = this.place;
//     data['rating'] = this.rating;
//     data['time'] = this.time;
//     return data;
//   }
// }

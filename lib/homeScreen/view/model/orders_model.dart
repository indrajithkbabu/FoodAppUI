// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);


// ignore_for_file: sort_constructors_first, lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str)as Map<String, dynamic>);

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
    OrdersModel({
        required this.nSnpDAzDfNiMlnc0Xq,
    });

    NSnpDAzDfNiMlnc0Xq nSnpDAzDfNiMlnc0Xq;

    factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        nSnpDAzDfNiMlnc0Xq: NSnpDAzDfNiMlnc0Xq.fromJson(json['-NSnp-dAZDfNiMLNC0xq']as Map<String, dynamic>),
    );

    Map<String, dynamic> toJson() => {
        '-NSnp-dAZDfNiMLNC0xq': nSnpDAzDfNiMlnc0Xq.toJson(),
    };
}

class NSnpDAzDfNiMlnc0Xq {
    NSnpDAzDfNiMlnc0Xq({
        required this.yourOrders,
    });

    List<YourOrder> yourOrders;

    factory NSnpDAzDfNiMlnc0Xq.fromJson(dynamic json) => NSnpDAzDfNiMlnc0Xq(
        yourOrders: List<YourOrder>.from((json['your_orders']as List).map((x) => YourOrder.fromJson(x as dynamic))),
    );

    Map<String, dynamic> toJson() => {
        'your_orders': List<dynamic>.from(yourOrders.map((x) => x.toJson())),
    };
}

class YourOrder {
    YourOrder({
        required this.date,
        required this.deliveryStatus,
        required this.hotelName,
        required this.id,
        required this.items,
        required this.place,
        required this.price,
        required this.time,
    });

    String date;
    String deliveryStatus;
    String hotelName;
    int id;
    List<Item> items;
    String place;
    int price;
    String time;

    factory YourOrder.fromJson(dynamic json) => YourOrder(
        date: json['date']as String,
        deliveryStatus: json['delivery_status']as String,
        hotelName: json['hotel_name']as String,
        id: json['id']as int,
        items: List<Item>.from((json['items']as List).map((x) => Item.fromJson(x as dynamic))),
        place: json['place']as String,
        price: json['price']as int,
        time: json['time']as String,
    );

    Map<String, dynamic> toJson() => {
        'date': date,
        'delivery_status': deliveryStatus,
        'hotel_name': hotelName,
        'id': id,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
        'place': place,
        'price': price,
        'time': time,
    };
}

class Item {
    Item({
        required this.food1,
        required this.food2,
    });

    String food1;
    String food2;

    factory Item.fromJson(dynamic json) => Item(
        food1: json['food_1']as String,
        food2: json['food_2']as String,
    );

    Map<String, dynamic> toJson() => {
        'food_1': food1,
        'food_2': food2,
    };
}

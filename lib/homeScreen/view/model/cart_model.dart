// To parse this JSON data, do
//
//     final viewCartModel = viewCartModelFromJson(jsonString);






// ignore_for_file: sort_constructors_first, avoid_dynamic_calls

class CartModel {
    CartModel({
        required this.content,
        required this.dishName,
        required this.id,
        required this.image,
        required this.price,
        required this.rating,
        required this.vegStatus,
        required this.quantity,
    });

    String content;
    String dishName;
    int id;
    String image;
    int price;
    double rating;
    String vegStatus;
    int quantity;

    factory CartModel.fromJson(dynamic json) => CartModel(
        content: json['content']as String,
        dishName: json['dish_name']as String,
        id: json['id']as int,
        image: json['image']as String,
        price: json['price']as int,
        rating: json['rating']as double,
        vegStatus: json['veg_status']as String,
        quantity: json['quantity']as int,
    );

    Map<String, dynamic> toJson() => {
        'content': content,
        'dish_name': dishName,
        'id': id,
        'image': image,
        'price': price,
        'rating': rating,
        'veg_status': vegStatus,
        'quantity':quantity
    };
}

import 'package:flutter/material.dart';

// class FoodModel {
//   FoodModel({required this.imgg, required this.foodName});
//   String? imgg;
//   String? foodName;
// }

// List<FoodModel> foodModelList = [
//   FoodModel(imgg: 'assets/images/food1.png', foodName: 'Biriyani'),
//   FoodModel(imgg: 'assets/images/food2.png', foodName: 'Porotta'),
//   FoodModel(imgg: 'assets/images/food3.png', foodName: 'Chapathy'),
//   FoodModel(imgg: 'assets/images/food1.png', foodName: 'Dosa'),
//   FoodModel(imgg: 'assets/images/food2.png', foodName: 'Idli'),
//   FoodModel(imgg: 'assets/images/food3.png', foodName: 'Poori'),
//   FoodModel(imgg: 'assets/images/food1.png', foodName: 'Idiyapam'),
// ];

class AccountNavBar {
  AccountNavBar({required this.accountDetails, required this.icon});
  String? accountDetails;
  final ImageIcon icon;
}

List<AccountNavBar> accountNavBarList = [
  AccountNavBar(
      accountDetails: 'Your orders',
      icon: const ImageIcon(
        AssetImage('assets/images/yourOrders.png'),
      ),),
  AccountNavBar(
    
      accountDetails: 'Address book',
      icon: const ImageIcon(
        AssetImage('assets/images/addressBook.png'),
      ),),
  AccountNavBar(
      accountDetails: 'Your transactions',
      icon: const ImageIcon(
        AssetImage('assets/images/yourTrans.png'),
      ),),
  AccountNavBar(
      accountDetails: 'Table reservations',
      icon: const ImageIcon(
        AssetImage('assets/images/tableReserve.png'),
      ),),
  AccountNavBar(
      accountDetails: 'Notifications',
      icon: const ImageIcon(
        AssetImage('assets/images/notification.png'),
      ),),
  AccountNavBar(
      accountDetails: 'Help',
      icon: const ImageIcon(
        AssetImage('assets/images/help.png'),
      ),),
];

// // ignore_for_file: lines_longer_than_80_chars, cast_nullable_to_non_nullable, unused_local_variable, prefer_if_elements_to_conditional_expressions, inference_failure_on_instance_creation

// import 'dart:ui';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
// import 'package:foodieapp/homeScreen/bloc/bloc/cart_bloc.dart';
// import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';
// import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
// import 'package:foodieapp/homeScreen/view/model/cart_model.dart';
// import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
// import 'package:foodieapp/homeScreen/view/widgets/home/top_bar_restaurants.dart';
// import 'package:foodieapp/homeScreen/view/widgets/home/view_cart.dart';
// import 'package:foodieapp/utils/constants.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:sizer/sizer.dart';

// class SelectedRestaurants extends StatefulWidget {
//   SelectedRestaurants({
//     required this.userDatas,
//     required this.index,
//     super.key,
//   });
//   List<XploreResto> userDatas;
//   int index;

//   @override
//   State<SelectedRestaurants> createState() => _SelectedRestaurantsState();
// }

// class _SelectedRestaurantsState extends State<SelectedRestaurants> {
//   final ref =  FirebaseDatabase.instance.ref('recommendeddish/-NSu2Qk_NJNeKiuv3-yX');
    


//   bool isExpand = false;
//   bool isCartButtonVisible = false;
//   Map<String, CartModel> cartData = {};

//   List<DishDetail> filterVegNonList = [];
//   List<DishDetail> searchList = [];

//   void filterSearchResults(String query) {
//     setState(() {
//       searchList = filterVegNonList
//           .where((e) => e.dishName.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   final TextEditingController _searchController = TextEditingController();
  
//   @override
//   Widget build(BuildContext context) {
   
//     return BlocBuilder<CartBloc, CartState>(
//       builder: (context, state) {
//          final List<CartModel> cartDataList = cartData.values.toList();
//         //  state.cartDataList=cartData.values.toList();
//         //  print(   state.cartDataList);

//     int totalItems = 0;
//     cartDataList.map((e) {
//       totalItems += e.quantity;
//     }).toList();

//     int grandTotal = 0;
//     cartDataList.map((e) {
//       grandTotal += e.quantity * e.price;
//     }).toList();
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TopBarRestaurants(
//                   userDatas: widget.userDatas,
//                   index: widget.index,
//                   searchController: _searchController,
//                   onChanged: (value) {
//                     filterSearchResults(value);
//                   },
//                 ),
//                 SizedBox(
//                   height: 2.5.h,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 3.h, right: 3.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         widget.userDatas[widget.index].hotel,
//                         style: FoodDeliveryTextStyles.homeScreenTitles
//                             .copyWith(fontSize: 20),
//                       ),
//                       SizedBox(
//                         height: .5.h,
//                       ),
//                       SizedBox(
//                         height: 3.h,
//                         width: 28.w,
//                         // color: Colors.amber,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Stack(
//                               children: [
//                                 SizedBox(
//                                   height: 2.7.h,
//                                   width: 13.w,
//                                   child: ElevatedButton(
//                                     onPressed: () {},
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: const Color(0xFFFFFFFF),
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(20),
//                                       ),
//                                     ),
//                                     child: Container(),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 4,
//                                   bottom: 2,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 2.sp),
//                                         child: const Icon(
//                                           Icons.star,
//                                           size: 15,
//                                           color: Color(0xFF1D9F80),
//                                         ),
//                                       ),
//                                       Text(
//                                         widget.userDatas[widget.index].rating
//                                             .toString(),

//                                         // '4.5',
//                                         style: FoodDeliveryTextStyles
//                                             .addressBookButtons
//                                             .copyWith(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Text(
//                               '${widget.userDatas[widget.index].time} min',
//                               style: FoodDeliveryTextStyles.homeScreenTitles
//                                   .copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: .5.h,
//                       ),
//                       Text(
//                         'North Indian,South Indian,Kerala...',
//                         style: FoodDeliveryTextStyles.editProfileTexts,
//                       ),
//                       SizedBox(
//                         height: .5.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '${widget.userDatas[widget.index].place} - ${widget.userDatas[widget.index].distance} km',
//                             style: FoodDeliveryTextStyles.homeScreenTitles
//                                 .copyWith(
//                               fontSize: 11.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           Icon(
//                             Icons.favorite,
//                             color: FoodDeliveryColor.logoutButtonColor,
//                             size: 18,
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2.5.h,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(5),
//                         height: 8.h,
//                         width: 90.w,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: FoodDeliveryColor.logoutButtonColor,
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Row(
//                           children: [
//                             Image.asset('assets/images/offerpercent.png'),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: 15.sp,
//                                 top: 2.sp,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '20% off upto ${FoodDeliveryConstantText.rupeesSymbol}120',
//                                     style:
//                                         FoodDeliveryTextStyles.homeScreenTitles,
//                                   ),
//                                   SizedBox(
//                                     height: .5.h,
//                                   ),
//                                   Text(
//                                     'Use Federalcc-Above ${FoodDeliveryConstantText.rupeesSymbol}249',
//                                     style: FoodDeliveryTextStyles
//                                         .homeScreenTitles
//                                         .copyWith(
//                                       fontSize: 11.sp,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       // SizedBox(
//                       //   height: .5.h,
//                       // ),
//                       Row(
//                         children: [
//                           Transform.scale(
//                             scale: 1,
//                             child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
//                               builder: (context, state) {
//                                 return Switch(
//                                   activeThumbImage: const AssetImage(
//                                     'assets/images/vegIcon.png',
//                                   ),
//                                   inactiveThumbImage: const AssetImage(
//                                     'assets/images/veg.png',
//                                   ),
//                                   value: state.isVeg,
//                                   activeColor: const Color(0xFF1D9F80),
//                                   onChanged: (value) {
//                                     context
//                                         .read<HomeScreenBloc>()
//                                         .add(VegSwitch(res: value));
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                           Transform.scale(
//                             scale: 1,
//                             child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
//                               builder: (context, state) {
//                                 return Switch(
//                                   activeThumbImage: const AssetImage(
//                                     'assets/images/Non veg.png',
//                                   ),
//                                   inactiveThumbImage: const AssetImage(
//                                     'assets/images/nonVegIcon.png',
//                                   ),
//                                   value: state.isNonVeg,
//                                   activeColor:
//                                       FoodDeliveryColor.logoutButtonColor,
//                                   onChanged: (value) {
//                                     context
//                                         .read<HomeScreenBloc>()
//                                         .add(NonVegSwitch(res: value));
//                                   },
//                                 );
//                               },
//                             ),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       BlocBuilder<ApiHomeBloc, ApiHomeState>(
//                         builder: (context, state) {
//                           if (state is RecommendedDishDataLoaded) {
//                             return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//                               builder: (context, state) {
//                                 return StreamBuilder(
//                                   stream: ref.onValue,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData &&
//                                         !snapshot.hasError &&
//                                         snapshot.data!.snapshot.value != null) {
//                                       final snap = snapshot.data!.snapshot.value
//                                           as Map<Object?, Object?>;
//                                       final snapData =
//                                           NSu2QkNjNeKiuv3YX.fromJson(snap);

//                                       final List<DishDetail> fullMenuList =
//                                           snapData.dishDetails;

//                                       if (state.isVeg == true &&
//                                           state.isNonVeg == false) {
//                                         filterVegNonList = fullMenuList
//                                             .where(
//                                               (e) =>
//                                                   e.vegStatus.contains('true'),
//                                             )
//                                             .toList();
//                                       } else if (state.isVeg == false &&
//                                           state.isNonVeg == true) {
//                                         filterVegNonList = fullMenuList
//                                             .where(
//                                               (e) =>
//                                                   e.vegStatus.contains('false'),
//                                             )
//                                             .toList();
//                                       } else {
//                                         filterVegNonList = fullMenuList;
//                                       }
//                                       return Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             'Recommended (${snapData.recommendedDishes})',
//                                             style: FoodDeliveryTextStyles
//                                                 .homeScreenTitles,
//                                           ),
//                                           SizedBox(
//                                             height: 3.h,
//                                           ),
//                                           SizedBox(
//                                             height: 65.h,
//                                             // color: Colors.amber,
//                                             child: BlocBuilder<CartBloc,
//                                                 CartState>(
//                                               builder: (context, state) {
//                                                 if (_searchController
//                                                     .text.isNotEmpty) {
//                                                   return ListView.builder(
//                                                     padding: EdgeInsets.zero,
//                                                     itemCount:
//                                                         searchList.length,
//                                                     itemBuilder:
//                                                         (context, index) {
//                                                       final cartDetails =
//                                                           cartData[
//                                                               searchList[index]
//                                                                   .id
//                                                                   .toString()];

//                                                       isExpand =
//                                                           cartData.containsKey(
//                                                         searchList[index]
//                                                             .id
//                                                             .toString(),
//                                                       );
//                                                       return Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           SizedBox(
//                                                             width: 51.w,
//                                                             // color: Colors.amber,
//                                                             child: Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 searchList[index]
//                                                                         .vegStatus
//                                                                         .contains(
//                                                                           'false',
//                                                                         )
//                                                                     ? Image
//                                                                         .asset(
//                                                                         'assets/images/Non veg.png',
//                                                                       )
//                                                                     : Image
//                                                                         .asset(
//                                                                         'assets/images/vegIcon.png',
//                                                                       ),
//                                                                 SizedBox(
//                                                                   height: 1.h,
//                                                                 ),
//                                                                 Text(
//                                                                   searchList[
//                                                                           index]
//                                                                       .dishName,
//                                                                   style: FoodDeliveryTextStyles
//                                                                       .homeScreenTitles
//                                                                       .copyWith(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     fontSize:
//                                                                         14,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 1.h,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 3.h,
//                                                                   width: 25.w,
//                                                                   // color: Colors.red,
//                                                                   child: Row(
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .spaceBetween,
//                                                                     children: [
//                                                                       Stack(
//                                                                         children: [
//                                                                           SizedBox(
//                                                                             height:
//                                                                                 2.5.h,
//                                                                             width:
//                                                                                 13.w,
//                                                                             child:
//                                                                                 ElevatedButton(
//                                                                               onPressed: () {},
//                                                                               style: ElevatedButton.styleFrom(
//                                                                                 backgroundColor: const Color(
//                                                                                   0xFFFFFFFF,
//                                                                                 ),
//                                                                                 shape: RoundedRectangleBorder(
//                                                                                   borderRadius: BorderRadius.circular(
//                                                                                     20,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               child: Container(),
//                                                                             ),
//                                                                           ),
//                                                                           Positioned(
//                                                                             left:
//                                                                                 4,
//                                                                             bottom:
//                                                                                 2,
//                                                                             child:
//                                                                                 Row(
//                                                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                               children: [
//                                                                                 Padding(
//                                                                                   padding: EdgeInsets.only(
//                                                                                     right: 2.sp,
//                                                                                   ),
//                                                                                   child: const Icon(
//                                                                                     Icons.star,
//                                                                                     size: 15,
//                                                                                     color: Color(
//                                                                                       0xFF1D9F80,
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                                 Text(
//                                                                                   searchList[index].rating.toString(),

//                                                                                   // '4.5',
//                                                                                   style: FoodDeliveryTextStyles.addressBookButtons.copyWith(
//                                                                                     fontSize: 14,
//                                                                                     fontWeight: FontWeight.w600,
//                                                                                   ),
//                                                                                   overflow: TextOverflow.clip,
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                           )
//                                                                         ],
//                                                                       ),
//                                                                       Text(
//                                                                         '${FoodDeliveryConstantText.rupeesSymbol} ${filterVegNonList[index].price}',
//                                                                         style: FoodDeliveryTextStyles
//                                                                             .homeScreenTitles
//                                                                             .copyWith(
//                                                                           fontSize:
//                                                                               14,
//                                                                           fontWeight:
//                                                                               FontWeight.w600,
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 1.h,
//                                                                 ),
//                                                                 Text(
//                                                                   searchList[
//                                                                           index]
//                                                                       .content,
//                                                                   maxLines: 2,
//                                                                   style: FoodDeliveryTextStyles
//                                                                       .editProfileTexts,
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 5.h,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 EdgeInsets.only(
//                                                               bottom: 12.sp,
//                                                             ),
//                                                             child: Stack(
//                                                               children: [
//                                                                 SizedBox(
//                                                                   height: 17.h,
//                                                                   child: Image
//                                                                       .network(
//                                                                     searchList[
//                                                                             index]
//                                                                         .image,
//                                                                     fit: BoxFit
//                                                                         .cover,
//                                                                   ),
//                                                                 ),
//                                                                 Positioned(
//                                                                   right: -9,
//                                                                   bottom: 5,
//                                                                   child:
//                                                                       Padding(
//                                                                     padding:
//                                                                         EdgeInsets
//                                                                             .only(
//                                                                       right:
//                                                                           2.h,
//                                                                     ),
//                                                                     child:
//                                                                         AnimatedContainer(
//                                                                       duration:
//                                                                           const Duration(
//                                                                         seconds:
//                                                                             1,
//                                                                       ),
//                                                                       // width: 5,height: 2,color: Colors.amber,
//                                                                       child:
//                                                                           ClipRRect(
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(
//                                                                           25,
//                                                                         ),
//                                                                         child: isExpand
//                                                                             ? Container(
//                                                                                 height: 5.h,
//                                                                                 width: 25.w,
//                                                                                 color: Colors.transparent,
//                                                                                 child: Stack(
//                                                                                   children: [
//                                                                                     BackdropFilter(
//                                                                                       filter: ImageFilter.blur(
//                                                                                         sigmaX: 4,
//                                                                                         sigmaY: 4,
//                                                                                       ),
//                                                                                       child: Container(),
//                                                                                     ),
//                                                                                     DecoratedBox(
//                                                                                       decoration: BoxDecoration(
//                                                                                         borderRadius: BorderRadius.circular(25),
//                                                                                         border: Border.all(
//                                                                                           color: Colors.white70,
//                                                                                         ),
//                                                                                         gradient: LinearGradient(
//                                                                                           begin: Alignment.topLeft,
//                                                                                           end: Alignment.bottomRight,
//                                                                                           colors: [
//                                                                                             Colors.white.withOpacity(0.15),
//                                                                                             Colors.white.withOpacity(0.05),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                       child: SizedBox(
//                                                                                         height: 5.h,
//                                                                                         width: 25.w,
//                                                                                         child: Padding(
//                                                                                           padding: EdgeInsets.only(
//                                                                                             bottom: 8.sp,
//                                                                                             top: 8.sp,
//                                                                                           ),
//                                                                                           child: Row(
//                                                                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                             children: [
//                                                                                               InkWell(
//                                                                                                 onTap: () {
//                                                                                                   if (cartDetails!.quantity <= 1) {
//                                                                                                     setState(() {
//                                                                                                       cartData.remove(searchList[index].id.toString());
//                                                                                                       if (cartData.isEmpty) {
//                                                                                                         isCartButtonVisible = false;
//                                                                                                       }
//                                                                                                     });
//                                                                                                   } else {
//                                                                                                     setState(() {
//                                                                                                       cartData.update(searchList[index].id.toString(), (value) {
//                                                                                                         return CartModel(
//                                                                                                           content: value.content,
//                                                                                                           dishName: value.dishName,
//                                                                                                           id: value.id,
//                                                                                                           image: value.image,
//                                                                                                           price: value.price,
//                                                                                                           rating: value.rating,
//                                                                                                           vegStatus: value.vegStatus,
//                                                                                                           quantity: value.quantity - 1,
//                                                                                                         );
//                                                                                                       });
//                                                                                                     });
//                                                                                                   }
//                                                                                                 },
//                                                                                                 child: SizedBox(
//                                                                                                   height: 4.h,
//                                                                                                   width: 4.h,
//                                                                                                   child: Image.asset(
//                                                                                                     'assets/images/minusButton.png', color: Colors.white70,
//                                                                                                     // fit: BoxFit.contain,
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ),
//                                                                                               Text(
//                                                                                                 // '0',
//                                                                                                 cartDetails!.quantity.toString(),
//                                                                                                 style: const TextStyle(fontSize: 20, color: Colors.white),
//                                                                                               ),
//                                                                                               InkWell(
//                                                                                                 onTap: () {
//                                                                                                   setState(() {
//                                                                                                     cartData.update(searchList[index].id.toString(), (value) {
//                                                                                                       return CartModel(
//                                                                                                         content: value.content,
//                                                                                                         dishName: value.dishName,
//                                                                                                         id: value.id,
//                                                                                                         image: value.image,
//                                                                                                         price: value.price,
//                                                                                                         rating: value.rating,
//                                                                                                         vegStatus: value.vegStatus,
//                                                                                                         quantity: value.quantity + 1,
//                                                                                                       );
//                                                                                                     });
//                                                                                                   });
//                                                                                                 },
//                                                                                                 child: SizedBox(
//                                                                                                   height: 4.h,
//                                                                                                   width: 4.h,
//                                                                                                   child: Image.asset(
//                                                                                                     'assets/images/add.png', color: Colors.white70,
//                                                                                                     // fit: BoxFit.contain,
//                                                                                                   ),
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ],
//                                                                                           ),
//                                                                                         ),
//                                                                                       ),
//                                                                                     )
//                                                                                   ],
//                                                                                 ),
//                                                                               )
//                                                                             : InkWell(
//                                                                                 onTap: () {
//                                                                                   setState(() {
//                                                                                     cartData[searchList[index].id.toString()] = CartModel(
//                                                                                       content: searchList[index].content,
//                                                                                       dishName: searchList[index].dishName,
//                                                                                       id: searchList[index].id,
//                                                                                       image: searchList[index].image,
//                                                                                       price: searchList[index].price,
//                                                                                       rating: searchList[index].rating,
//                                                                                       vegStatus: searchList[index].vegStatus,
//                                                                                       quantity: 1,
//                                                                                     );
//                                                                                     if (cartData.isNotEmpty) {
//                                                                                       // print('add item');
//                                                                                       isCartButtonVisible = true;
//                                                                                     }
//                                                                                   });
//                                                                                 },
//                                                                                 child: Container(
//                                                                                   height: 4.5.h,
//                                                                                   width: 4.5.h,
//                                                                                   decoration: const BoxDecoration(
//                                                                                     color: Color(
//                                                                                       0xFF1D9F80,
//                                                                                     ),
//                                                                                     shape: BoxShape.circle,
//                                                                                   ),
//                                                                                   child: Padding(
//                                                                                     padding: const EdgeInsets.all(
//                                                                                       14,
//                                                                                     ),
//                                                                                     child: Image.asset(
//                                                                                       'assets/images/add.png',
//                                                                                       fit: BoxFit.contain,
//                                                                                     ),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           )
//                                                         ],
//                                                       );
//                                                     },
//                                                   );
//                                                 }
//                                                 return ListView.builder(
//                                                   padding: EdgeInsets.zero,
//                                                   itemCount:
//                                                       // isFilterVeg
//                                                       //     ? 1
//                                                       //     :
//                                                       filterVegNonList.length,
//                                                   itemBuilder:
//                                                       (context, index) {
//                                                     final cartDetails =
//                                                         cartData[
//                                                             filterVegNonList[
//                                                                     index]
//                                                                 .id
//                                                                 .toString()];

//                                                     isExpand =
//                                                         cartData.containsKey(
//                                                       filterVegNonList[index]
//                                                           .id
//                                                           .toString(),
//                                                     );

//                                                     return Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         SizedBox(
//                                                           width: 51.w,
//                                                           // color: Colors.amber,
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               filterVegNonList[
//                                                                           index]
//                                                                       .vegStatus
//                                                                       .contains(
//                                                                         'false',
//                                                                       )
//                                                                   ? Image.asset(
//                                                                       'assets/images/Non veg.png',
//                                                                     )
//                                                                   : Image.asset(
//                                                                       'assets/images/vegIcon.png',
//                                                                     ),
//                                                               SizedBox(
//                                                                 height: 1.h,
//                                                               ),
//                                                               Text(
//                                                                 filterVegNonList[
//                                                                         index]
//                                                                     .dishName,
//                                                                 style: FoodDeliveryTextStyles
//                                                                     .homeScreenTitles
//                                                                     .copyWith(
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w600,
//                                                                   fontSize: 14,
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.h,
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 3.h,
//                                                                 width: 25.w,
//                                                                 // color: Colors.red,
//                                                                 child: Row(
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .spaceBetween,
//                                                                   children: [
//                                                                     Stack(
//                                                                       children: [
//                                                                         SizedBox(
//                                                                           height:
//                                                                               2.5.h,
//                                                                           width:
//                                                                               13.w,
//                                                                           child:
//                                                                               ElevatedButton(
//                                                                             onPressed:
//                                                                                 () {},
//                                                                             style:
//                                                                                 ElevatedButton.styleFrom(
//                                                                               backgroundColor: const Color(
//                                                                                 0xFFFFFFFF,
//                                                                               ),
//                                                                               shape: RoundedRectangleBorder(
//                                                                                 borderRadius: BorderRadius.circular(
//                                                                                   20,
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                             child:
//                                                                                 Container(),
//                                                                           ),
//                                                                         ),
//                                                                         Positioned(
//                                                                           left:
//                                                                               4,
//                                                                           bottom:
//                                                                               2,
//                                                                           child:
//                                                                               Row(
//                                                                             mainAxisAlignment:
//                                                                                 MainAxisAlignment.spaceEvenly,
//                                                                             children: [
//                                                                               Padding(
//                                                                                 padding: EdgeInsets.only(
//                                                                                   right: 2.sp,
//                                                                                 ),
//                                                                                 child: const Icon(
//                                                                                   Icons.star,
//                                                                                   size: 15,
//                                                                                   color: Color(
//                                                                                     0xFF1D9F80,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               Text(
//                                                                                 filterVegNonList[index].rating.toString(),

//                                                                                 // '4.5',
//                                                                                 style: FoodDeliveryTextStyles.addressBookButtons.copyWith(
//                                                                                   fontSize: 14,
//                                                                                   fontWeight: FontWeight.w600,
//                                                                                 ),
//                                                                                 overflow: TextOverflow.clip,
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         )
//                                                                       ],
//                                                                     ),
//                                                                     Text(
//                                                                       '${FoodDeliveryConstantText.rupeesSymbol} ${filterVegNonList[index].price}',
//                                                                       style: FoodDeliveryTextStyles
//                                                                           .homeScreenTitles
//                                                                           .copyWith(
//                                                                         fontSize:
//                                                                             14,
//                                                                         fontWeight:
//                                                                             FontWeight.w600,
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 1.h,
//                                                               ),
//                                                               Text(
//                                                                 filterVegNonList[
//                                                                         index]
//                                                                     .content,
//                                                                 maxLines: 2,
//                                                                 style: FoodDeliveryTextStyles
//                                                                     .editProfileTexts,
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 5.h,
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         Padding(
//                                                           padding:
//                                                               EdgeInsets.only(
//                                                             bottom: 12.sp,
//                                                           ),
//                                                           child: Stack(
//                                                             children: [
//                                                               SizedBox(
//                                                                 height: 17.h,
//                                                                 child: Image
//                                                                     .network(
//                                                                   filterVegNonList[
//                                                                           index]
//                                                                       .image,
//                                                                   fit: BoxFit
//                                                                       .cover,
//                                                                 ),
//                                                               ),
//                                                               Positioned(
//                                                                 right: -9,
//                                                                 bottom: 5,
//                                                                 child: Padding(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .only(
//                                                                     right: 2.h,
//                                                                   ),
//                                                                   child:
//                                                                       AnimatedContainer(
//                                                                     duration:
//                                                                         const Duration(
//                                                                       seconds:
//                                                                           1,
//                                                                     ),
//                                                                     // width: 5,height: 2,color: Colors.amber,
//                                                                     child:
//                                                                         ClipRRect(
//                                                                       borderRadius:
//                                                                           BorderRadius
//                                                                               .circular(
//                                                                         25,
//                                                                       ),
//                                                                       child: isExpand
//                                                                           ? Container(
//                                                                               height: 5.h,
//                                                                               width: 25.w,
//                                                                               color: Colors.transparent,
//                                                                               child: Stack(
//                                                                                 children: [
//                                                                                   BackdropFilter(
//                                                                                     filter: ImageFilter.blur(
//                                                                                       sigmaX: 4,
//                                                                                       sigmaY: 4,
//                                                                                     ),
//                                                                                     child: Container(),
//                                                                                   ),
//                                                                                   DecoratedBox(
//                                                                                     decoration: BoxDecoration(
//                                                                                       borderRadius: BorderRadius.circular(25),
//                                                                                       border: Border.all(
//                                                                                         color: Colors.white70,
//                                                                                       ),
//                                                                                       gradient: LinearGradient(
//                                                                                         begin: Alignment.topLeft,
//                                                                                         end: Alignment.bottomRight,
//                                                                                         colors: [
//                                                                                           Colors.white.withOpacity(0.15),
//                                                                                           Colors.white.withOpacity(0.05),
//                                                                                         ],
//                                                                                       ),
//                                                                                     ),
//                                                                                     child: SizedBox(
//                                                                                       height: 5.h,
//                                                                                       width: 25.w,
//                                                                                       child: Padding(
//                                                                                         padding: EdgeInsets.only(
//                                                                                           bottom: 8.sp,
//                                                                                           top: 8.sp,
//                                                                                         ),
//                                                                                         child: Row(
//                                                                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                           children: [
//                                                                                             InkWell(
//                                                                                               onTap: () {
//                                                                                                 if (cartDetails!.quantity <= 1) {
//                                                                                                   setState(() {
//                                                                                                     cartData.remove(filterVegNonList[index].id.toString());
//                                                                                                     if (cartData.isEmpty) {
//                                                                                                       isCartButtonVisible = false;
//                                                                                                     }
//                                                                                                   });
//                                                                                                 } else {
//                                                                                                   setState(() {
//                                                                                                     cartData.update(filterVegNonList[index].id.toString(), (value) {
//                                                                                                       return CartModel(
//                                                                                                         content: value.content,
//                                                                                                         dishName: value.dishName,
//                                                                                                         id: value.id,
//                                                                                                         image: value.image,
//                                                                                                         price: value.price,
//                                                                                                         rating: value.rating,
//                                                                                                         vegStatus: value.vegStatus,
//                                                                                                         quantity: value.quantity - 1,
//                                                                                                       );
//                                                                                                     });
//                                                                                                   });
//                                                                                                 }
//                                                                                               },
//                                                                                               child: SizedBox(
//                                                                                                 height: 4.h,
//                                                                                                 width: 4.h,
//                                                                                                 child: Image.asset(
//                                                                                                   'assets/images/minusButton.png', color: Colors.white70,
//                                                                                                   // fit: BoxFit.contain,
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                             Text(
//                                                                                               // '0',
//                                                                                               cartDetails!.quantity.toString(),
//                                                                                               style: const TextStyle(fontSize: 20, color: Colors.white),
//                                                                                             ),
//                                                                                             InkWell(
//                                                                                               onTap: () async {
//                                                                                                 setState(() {
//                                                                                                   cartData.update(filterVegNonList[index].id.toString(), (value) {
//                                                                                                     return CartModel(
//                                                                                                       content: value.content,
//                                                                                                       dishName: value.dishName,
//                                                                                                       id: value.id,
//                                                                                                       image: value.image,
//                                                                                                       price: value.price,
//                                                                                                       rating: value.rating,
//                                                                                                       vegStatus: value.vegStatus,
//                                                                                                       quantity: value.quantity + 1,
//                                                                                                     );
//                                                                                                   });
//                                                                                                 });
//                                                                                               },
//                                                                                               child: SizedBox(
//                                                                                                 height: 4.h,
//                                                                                                 width: 4.h,
//                                                                                                 child: Image.asset(
//                                                                                                   'assets/images/add.png', color: Colors.white70,
//                                                                                                   // fit: BoxFit.contain,
//                                                                                                 ),
//                                                                                               ),
//                                                                                             ),
//                                                                                           ],
//                                                                                         ),
//                                                                                       ),
//                                                                                     ),
//                                                                                   )
//                                                                                 ],
//                                                                               ),
//                                                                             )
//                                                                           : InkWell(
//                                                                               onTap: () {
//                                                                                 // cartData[filterVegNonList[index].id.toString()] = CartModel(
//                                                                                 //   content: filterVegNonList[index].content,
//                                                                                 //   dishName: filterVegNonList[index].dishName,
//                                                                                 //   id: filterVegNonList[index].id,
//                                                                                 //   image: filterVegNonList[index].image,
//                                                                                 //   price: filterVegNonList[index].price,
//                                                                                 //   rating: filterVegNonList[index].rating,
//                                                                                 //   vegStatus: filterVegNonList[index].vegStatus,
//                                                                                 //   quantity: 1,
//                                                                                 // );
//                                                                                 // print(cartDataList);

                                                                                
//                                                                                 // context.read<CartBloc>().add(CartFirstIncrementItem(res: cartDataList));

//                                                                                  context.read<CartBloc>().add(CartFirstIncrementItem(res: CartModel(
//                                                                                   content: filterVegNonList[index].content,
//                                                                                   dishName: filterVegNonList[index].dishName,
//                                                                                   id: filterVegNonList[index].id,
//                                                                                   image: filterVegNonList[index].image,
//                                                                                   price: filterVegNonList[index].price,
//                                                                                   rating: filterVegNonList[index].rating,
//                                                                                   vegStatus: filterVegNonList[index].vegStatus,
//                                                                                   quantity: 1,
//                                                                                 )));



//                                                                                 // setState(() {
//                                                                                 // cartData[filterVegNonList[index].id.toString()] = CartModel(
//                                                                                 //   content: filterVegNonList[index].content,
//                                                                                 //   dishName: filterVegNonList[index].dishName,
//                                                                                 //   id: filterVegNonList[index].id,
//                                                                                 //   image: filterVegNonList[index].image,
//                                                                                 //   price: filterVegNonList[index].price,
//                                                                                 //   rating: filterVegNonList[index].rating,
//                                                                                 //   vegStatus: filterVegNonList[index].vegStatus,
//                                                                                 //   quantity: 1,
//                                                                                 // );
//                                                                                 //   if (cartData.isNotEmpty) {
//                                                                                 //     // print('add item');
//                                                                                 //     isCartButtonVisible = true;
//                                                                                 //   }
//                                                                                 // });
//                                                                               },
//                                                                               child: Container(
//                                                                                 height: 4.5.h,
//                                                                                 width: 4.5.h,
//                                                                                 decoration: const BoxDecoration(
//                                                                                   color: Color(
//                                                                                     0xFF1D9F80,
//                                                                                   ),
//                                                                                   shape: BoxShape.circle,
//                                                                                 ),
//                                                                                 child: Padding(
//                                                                                   padding: const EdgeInsets.all(
//                                                                                     14,
//                                                                                   ),
//                                                                                   child: Image.asset(
//                                                                                     'assets/images/add.png',
//                                                                                     fit: BoxFit.contain,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     );
//                                                   },
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       );
//                                     } else {
//                                       return Center(
//                                         child: CircularProgressIndicator(
//                                           color: FoodDeliveryColor.buttonColor,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                 );
//                               },
//                             );
//                           } else if (state is RecommendedDishDataLoading) {
//                             return Shimmer.fromColors(
//                               baseColor: Colors.grey.shade400,
//                               highlightColor: Colors.grey.shade300,
//                               child: SizedBox(
//                                 height: 65.h,
//                                 // color: Colors.amber,
//                                 child: ListView.builder(
//                                   padding: EdgeInsets.zero,
//                                   // itemCount:filterVegNonList.length,
//                                   itemBuilder: (context, index) {
//                                     return Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         SizedBox(
//                                           width: 51.w,
//                                           // color: Colors.amber,
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               SizedBox(
//                                                 height: 8.h,
//                                               ),
//                                               Container(
//                                                 color: Colors.white,
//                                                 height: 2.h,
//                                                 width: 15.w,
//                                               ),
//                                               SizedBox(
//                                                 height: 1.h,
//                                               ),
//                                               Container(
//                                                 color: Colors.white,
//                                                 height: 2.h,
//                                                 width: 24.w,
//                                               ),
//                                               SizedBox(
//                                                 height: 1.h,
//                                               ),
//                                               Container(
//                                                 color: Colors.white,
//                                                 height: 2.h,
//                                                 width: 45.w,
//                                               ),
//                                               SizedBox(
//                                                 height: .5.h,
//                                               ),
//                                               Container(
//                                                 color: Colors.white,
//                                                 height: 2.h,
//                                                 width: 47.w,
//                                               ),
//                                               SizedBox(
//                                                 height: 5.h,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 17.h,
//                                           child: Container(
//                                             height: 17.h,
//                                             width: 28.w,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(25),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 ),
//                               ),
//                             );
//                           } else {
//                             // print("err");
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: FloatingActionButton(
//             isExtended: true,
//             onPressed: () {},
//             child: Container(
//               height: 7.h,
//               width: 7.h,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(35)),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.black54,
//                     blurRadius: 10,
//                     offset: Offset(0, 0.7),
//                   )
//                 ],
//                 color: Colors.white,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/menuButton.png',
//                     // fit:  BoxFit.contain,
//                   ),
//                   Text(
//                     FoodDeliveryConstantText.menu,
//                     style: FoodDeliveryTextStyles.addressBookButtons.copyWith(
//                       fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
//             builder: (context, state) {
//               return Visibility(
//                 visible: isCartButtonVisible,
//                 child: Container(
//                   height: 56,
//                   decoration: BoxDecoration(
//                     color: FoodDeliveryColor.buttonColor,
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                   ),
//                   margin:
//                       EdgeInsets.only(bottom: 12.sp, left: 10.sp, right: 10.sp),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 8.sp),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               //  cartData.values.first.quantity. toString(),
//                               '$totalItems ITEMS',
//                               // cartData,
//                               style: FoodDeliveryTextStyles.exploreRestoBanner
//                                   .copyWith(
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               '${FoodDeliveryConstantText.rupeesSymbol} $grandTotal',
//                               style: FoodDeliveryTextStyles.exploreRestoBanner,
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5.sp),
//                         child: SizedBox(
//                           height: 5.h,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ViewCart(
//                                     viewCartDatas: cartData,
//                                     userDatas: widget.userDatas[widget.index],
//                                   ),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),
//                             child: Text(
//                               'view cart',
//                               style: FoodDeliveryTextStyles.addressBookButtons
//                                   .copyWith(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

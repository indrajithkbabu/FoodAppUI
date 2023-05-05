// ignore_for_file: lines_longer_than_80_chars

import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/viewcart_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/hotel_details.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/offer_box.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/shimmer.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/switch_buttons.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/top_bar_restaurants.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class OpenSelectedRestaurant extends StatelessWidget {
  OpenSelectedRestaurant(
      {required this.userDatas, required this.index, super.key});
  List<XploreResto> userDatas;
  int index;
  final TextEditingController _searchController = TextEditingController();
  final ref =
      FirebaseDatabase.instance.ref('recommendeddish/-NSu2Qk_NJNeKiuv3-yX');
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarRestaurants(
              userDatas: userDatas,
              index: index,
              searchController: _searchController,
              onChanged: (value) {
                // filterSearchResults(value);
              },
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HotelDetails(
                    userDatas: userDatas,
                    index: index,
                  ),
                  const OfferBox(),
                  const SwitchVegNon(),
                  BlocBuilder<ApiHomeBloc, ApiHomeState>(
                    builder: (context, state) {
                      if (state is RecommendedDishDataLoaded) {
                        return StreamBuilder(
                          stream: ref.onValue,
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                !snapshot.hasError &&
                                snapshot.data!.snapshot.value != null) {
                              final snap = snapshot.data!.snapshot.value
                                  as Map<Object?, Object?>;
                              final snapData = NSu2QkNjNeKiuv3YX.fromJson(snap);
                              final snapDetails = snapData.dishDetails;
                              context
                                  .read<ViewcartBloc>()
                                  .add(FetchAllData(dataList: snapDetails));
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // firebaseRtdb();
                                    },
                                    child: Text(
                                      'Recommended (${snapData.recommendedDishes})',
                                      style: FoodDeliveryTextStyles
                                          .homeScreenTitles,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    height: 65.h,
                                    child:
                                        BlocBuilder<ViewcartBloc, ViewcartState>(
                                      builder: (context, state) {
                                        
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount:
                                              state.dataList.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 51.w,
                                                  // color: Colors.amber,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                       state.dataList[
                                                                  index]
                                                              .vegStatus
                                                              .contains(
                                                        'false',
                                                      )
                                                          ? Image.asset(
                                                              'assets/images/Non veg.png',
                                                            )
                                                          : Image.asset(
                                                              'assets/images/vegIcon.png',
                                                            ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        state.dataList[index]
                                                            .dishName,
                                                        style:
                                                            FoodDeliveryTextStyles
                                                                .homeScreenTitles
                                                                .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                        width: 25.w,
                                                        // color: Colors.red,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                SizedBox(
                                                                  height: 2.5.h,
                                                                  width: 13.w,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          const Color(
                                                                        0xFFFFFFFF,
                                                                      ),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 4,
                                                                  bottom: 2,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          right:
                                                                              2.sp,
                                                                        ),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .star,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Color(
                                                                            0xFF1D9F80,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        snapData
                                                                            .dishDetails[index]
                                                                            .rating
                                                                            .toString(),

                                                                        // '4.5',
                                                                        style: FoodDeliveryTextStyles
                                                                            .addressBookButtons
                                                                            .copyWith(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              '${FoodDeliveryConstantText.rupeesSymbol} ${ state.dataList[index].price}',
                                                              style: FoodDeliveryTextStyles
                                                                  .homeScreenTitles
                                                                  .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                         state.dataList[index]
                                                            .content,
                                                        maxLines: 2,
                                                        style:
                                                            FoodDeliveryTextStyles
                                                                .editProfileTexts,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 12.sp,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        height: 17.h,
                                                        child: Image.network(
                                                          state.dataList[
                                                                  index]
                                                              .image,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: -9,
                                                        bottom: 5,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: 2.h,
                                                          ),
                                                          child:
                                                              AnimatedContainer(
                                                            duration:
                                                                const Duration(
                                                              seconds: 1,
                                                            ),
                                                            // width: 5,height: 2,color: Colors.amber,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                25,
                                                              ),
                                                              child: isExpand
                                                                  ? Container(
                                                                      height:
                                                                          5.h,
                                                                      width:
                                                                          25.w,
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 4,
                                                                              sigmaY: 4,
                                                                            ),
                                                                            child:
                                                                                Container(),
                                                                          ),
                                                                          DecoratedBox(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                              border: Border.all(
                                                                                color: Colors.white70,
                                                                              ),
                                                                              gradient: LinearGradient(
                                                                                begin: Alignment.topLeft,
                                                                                end: Alignment.bottomRight,
                                                                                colors: [
                                                                                  Colors.white.withOpacity(0.15),
                                                                                  Colors.white.withOpacity(0.05),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                SizedBox(
                                                                              height: 5.h,
                                                                              width: 25.w,
                                                                              child: Padding(
                                                                                padding: EdgeInsets.only(
                                                                                  bottom: 8.sp,
                                                                                  top: 8.sp,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        // if (cartDetails!.quantity <= 1) {
                                                                                        // setState(() {
                                                                                        //   cartData.remove(searchList[index].id.toString());
                                                                                        //   if (cartData.isEmpty) {
                                                                                        //     isCartButtonVisible = false;
                                                                                        //   }
                                                                                        // });
                                                                                        // }
                                                                                        //  else {
                                                                                        // setState(() {
                                                                                        //   cartData.update(searchList[index].id.toString(), (value) {
                                                                                        //     return CartModel(
                                                                                        //       content: value.content,
                                                                                        //       dishName: value.dishName,
                                                                                        //       id: value.id,
                                                                                        //       image: value.image,
                                                                                        //       price: value.price,
                                                                                        //       rating: value.rating,
                                                                                        //       vegStatus: value.vegStatus,
                                                                                        //       quantity: value.quantity - 1,
                                                                                        //     );
                                                                                        //   });
                                                                                        // });
                                                                                        // }
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        height: 4.h,
                                                                                        width: 4.h,
                                                                                        child: Image.asset(
                                                                                          'assets/images/minusButton.png', color: Colors.white70,
                                                                                          // fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    const Text(
                                                                                      '0',
                                                                                      // cartDetails!.quantity.toString(),
                                                                                      style: TextStyle(fontSize: 20, color: Colors.white),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        // setState(() {
                                                                                        //   cartData.update(searchList[index].id.toString(), (value) {
                                                                                        //     return CartModel(
                                                                                        //       content: value.content,
                                                                                        //       dishName: value.dishName,
                                                                                        //       id: value.id,
                                                                                        //       image: value.image,
                                                                                        //       price: value.price,
                                                                                        //       rating: value.rating,
                                                                                        //       vegStatus: value.vegStatus,
                                                                                        //       quantity: value.quantity + 1,
                                                                                        //     );
                                                                                        //   });
                                                                                        // });
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        height: 4.h,
                                                                                        width: 4.h,
                                                                                        child: Image.asset(
                                                                                          'assets/images/add.png', color: Colors.white70,
                                                                                          // fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : InkWell(
                                                                      onTap:
                                                                          () {
                                                                        // setState(() {
                                                                        //   cartData[searchList[index].id.toString()] = CartModel(
                                                                        //     content: searchList[index].content,
                                                                        //     dishName: searchList[index].dishName,
                                                                        //     id: searchList[index].id,
                                                                        //     image: searchList[index].image,
                                                                        //     price: searchList[index].price,
                                                                        //     rating: searchList[index].rating,
                                                                        //     vegStatus: searchList[index].vegStatus,
                                                                        //     quantity: 1,
                                                                        //   );
                                                                        //   if (cartData.isNotEmpty) {
                                                                        //     // print('add item');
                                                                        //     isCartButtonVisible = true;
                                                                        //   }
                                                                        // });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            4.5.h,
                                                                        width:
                                                                            4.5.h,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(
                                                                            0xFF1D9F80,
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(
                                                                            14,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/add.png',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: FoodDeliveryColor.buttonColor,
                                ),
                              );
                            }
                          },
                        );
                      } else if (state is RecommendedDishDataLoading) {
                        return const ShimmerEffect();
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

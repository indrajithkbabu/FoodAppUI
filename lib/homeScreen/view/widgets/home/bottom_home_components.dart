// ignore_for_file: lines_longer_than_80_chars, cast_nullable_to_non_nullable, inference_failure_on_instance_creation

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/widgets/favorites/fav_manager.dart';
import 'package:foodieapp/homeScreen/view/widgets/favorites/favorites_tab.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/select_restaurants.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/open_restaurants.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class BottomHomeComponents extends StatefulWidget {
  const BottomHomeComponents({super.key});

  @override
  State<BottomHomeComponents> createState() => _BottomHomeComponentsState();
}

class _BottomHomeComponentsState extends State<BottomHomeComponents> {
  //  List<String>favorites=[];
  @override
  void initState() {
    // getFavorites();
    // print(getFavorites());
    super.initState();
  }

// Future<List<String>> getFavorites() async {
//     final SharedPreferences prefs =await SharedPreferences.getInstance();
//     final List<String> favorites = prefs.getStringList('favKey') ?? [];
//     print(favorites);
//     return favorites;
//   }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiHomeBloc, ApiHomeState>(
      builder: (context, state) {
        if (state is ApiHomeLoaded) {
          final HomeApiModel userRes = state.result;
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22.sp),
                    child: Text(
                      ' ${userRes.data.nrWifmDJwiwH8WwvlhV.hotelCount} ${FoodDeliveryConstantText.exploreRestoTitle}',
                      style: FoodDeliveryTextStyles.homeScreenTitles,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 60.h,
                child: ListView.builder(
                  itemCount:
                      userRes.data.nrWifmDJwiwH8WwvlhV.xploreResto.length,
                  //  imgList.length,
                  itemBuilder: (context, index) {
                    final userData =
                        userRes.data.nrWifmDJwiwH8WwvlhV.xploreResto;

                    // final img = imgList[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 15.sp,
                        left: 20.sp,
                        right: 20.sp,
                      ),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<ApiHomeBloc>()
                              .add(FetchRecommendedDishDetails());
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OpenSelectedRestaurant(
                                     userDatas: userData, index: index
                                    ),
                              ));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SelectedRestaurants(
                          //           userDatas: userData, index: index),
                          //     ));
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    // img,
                                    userData[index].image,
                                    height: 13.h,
                                    width: 87.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.sp,
                                    right: 5.sp,
                                    top: 5.sp,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            // 'Chakarapanthal'
                                            userData[index].hotel,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 5.sp,
                                            ),
                                            child: Text(
                                              // 'Kochi -5km'
                                              ' ${userData[index].place} - ${userData[index].distance}kms  ',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 1.5.sp,
                                              bottom: 2.sp,
                                            ),
                                            child: Image.asset(
                                              'assets/images/deliveryBike.png',
                                            ),
                                          ),
                                          Text(
                                            // '30 min'
                                            '${userData[index].time} mins',
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 13.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: FoodDeliveryColor.gradient,
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              left: 20,
                              child: Text(
                                // '10 %off',
                                '${userData[index].off} %Off',
                                style: FoodDeliveryTextStyles.exploreRestoBanner
                                    .copyWith(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 55,
                              left: 20,
                              child: Text(
                                'upto ${FoodDeliveryConstantText.rupeesSymbol} 125',
                                style: FoodDeliveryTextStyles.exploreRestoBanner
                                    .copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 10,
                                right: 15,
                                child: InkWell(
                                  onTap: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    if (favList.contains(userData[index])) {
                                      favList.remove(userData[index]);
                                      List<String> favorites = favList
                                          .map((e) => e.toJson().toString())
                                          .toList();
                                      // print(favorites);
                                      prefs.setStringList('favKey', favorites);
                                      getFavorites();
                                    } else {
                                      favList.add(userData[index]);
//                                     final  List<String> favorites=jsonEncode(favList.map((e)  => e.toJson()).toList()).toString() as List<String>;
// print(favorites);
                                      List<String> favorites = favList
                                          .map((e) => jsonEncode(e.toJson()))
                                          .toList();
                                      // print(favorites);
                                      // getFavorites();
                                      // String favoritesJson = jsonEncode(favorites);

                                      prefs.setStringList('favKey', favorites);
                                      //  getFavorites();
                                    }
                                    setState(() {});
                                  },
                                  child: favList.contains(userData[index])
                                      ? Icon(
                                          Icons.favorite,
                                          color: FoodDeliveryColor
                                              .logoutButtonColor,
                                        )
                                      : const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white,
                                        ),
                                )),
                            Positioned(
                              right: 15,
                              bottom: 58,
                              child: SizedBox(
                                height: 3.5.h,
                                width: 18.w,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE6556F),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 2.sp,
                                        ),
                                        child: const Icon(
                                          Icons.star,
                                          size: 14,
                                        ),
                                      ),
                                      Text(
                                        //  '4.5',

                                        userData[index].rating.toString(),
                                        style: FoodDeliveryTextStyles
                                            .exploreRestoBanner
                                            .copyWith(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is ApiHomeLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade300,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 22.sp),
                      child: Container(
                        color: Colors.white,
                        height: 2.h,
                        width: 55.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 60.h,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 15.sp,
                      left: 20.sp,
                      right: 20.sp,
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                height: 13.h,
                                color: Colors.white,
                                width: 87.w,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

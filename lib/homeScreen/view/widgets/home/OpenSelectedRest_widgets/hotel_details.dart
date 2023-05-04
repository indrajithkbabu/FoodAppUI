import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class HotelDetails extends StatelessWidget {
 HotelDetails({ required this.userDatas,
    required this.index,super.key});
 List<XploreResto> userDatas;
  int index;
  @override
  Widget build(BuildContext context) {
    return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userDatas[index].hotel,
                        style: FoodDeliveryTextStyles.homeScreenTitles
                            .copyWith(fontSize: 20),
                      ),SizedBox(
                        height: .5.h,
                      ),SizedBox(
                        height: 3.h,
                        width: 28.w,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  height: 2.7.h,
                                  width: 13.w,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Container(),
                                  ),
                                ),
                                Positioned(
                                  left: 4,
                                  bottom: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 2.sp),
                                        child: const Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFF1D9F80),
                                        ),
                                      ),
                                      Text(
                                        userDatas[index].rating
                                            .toString(),

                                        // '4.5',
                                        style: FoodDeliveryTextStyles
                                            .addressBookButtons
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              '${userDatas[index].time} min',
                              style: FoodDeliveryTextStyles.homeScreenTitles
                                  .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                          ],
                        ),
                      ), SizedBox(
                        height: .5.h,
                      ),
                      Text(
                        'North Indian,South Indian,Kerala...',
                        style: FoodDeliveryTextStyles.editProfileTexts,
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${userDatas[index].place} - ${userDatas[index].distance} km',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.favorite,
                            color: FoodDeliveryColor.logoutButtonColor,
                            size: 18,
                          )
                        ],
                      ), SizedBox(
                        height: 2.5.h,
                      ),
                      

                    ],
                  );
  }
}
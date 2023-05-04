// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class OfferBox extends StatelessWidget {
  const OfferBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        padding: const EdgeInsets.all(5),
                        height: 8.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: FoodDeliveryColor.logoutButtonColor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/images/offerpercent.png'),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 15.sp,
                                top: 2.sp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '20% off upto ${FoodDeliveryConstantText.rupeesSymbol}120',
                                    style:
                                        FoodDeliveryTextStyles.homeScreenTitles,
                                  ),
                                  SizedBox(
                                    height: .5.h,
                                  ),
                                  Text(
                                    'Use Federalcc-Above ${FoodDeliveryConstantText.rupeesSymbol}249',
                                    style: FoodDeliveryTextStyles
                                        .homeScreenTitles
                                        .copyWith(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
  }
}

// ignore_for_file: inference_failure_on_instance_creation, must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class TopBarRestaurants extends StatelessWidget {
  TopBarRestaurants({
    required this.userDatas,
    required this.searchController,
     required this.index,
     required this.onChanged,
      super.key,});
  List<XploreResto> userDatas;
  int index;
  String? Function(String)? onChanged;
TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 27.sp),
        child: Stack(
          children: [
            SizedBox(
              // color: Colors.black54,
              height: 15.h,
              width: double.infinity,
              child: Image.network(
                userDatas[index].image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20,
              bottom: 32,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenHome(),
                      ),);
                },
                child: Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      'assets/images/backButton.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
               right: 20,
                bottom: 32,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                     color: Colors.transparent,
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter:
                              ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Container(
                            
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.white24),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                          ),
                            child: SizedBox(
                              height: 5.h,
                              width: 5.h,
                              child:  Padding(
                      padding: EdgeInsets.only(bottom: 8.sp, top: 8.sp),
                      child: Image.asset(
                        'assets/images/settings.png',color: Colors.white70,
                        // fit: BoxFit.contain,
                      ),
                    ),
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                ),
           
            Positioned(
                right: 70,
                bottom: 32,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 5.h,
                    width: 40.w,
                     color: Colors.transparent,
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter:
                              ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                          child: Container(
                            
                          ),
                        ),
                       DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.white24),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                          ),
                            child: TextFormField(
                               controller: searchController,
                              onChanged:onChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'Search menu',
                    hintStyle: FoodDeliveryTextStyles.editProfileTexts.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white60,
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(bottom: 8.sp, top: 8.sp),
                      child: Image.asset(
                        'assets/images/searchLoc.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(bottom: 8.sp, top: 8.sp),
                  ),
                ),
                        )
                      ],
                    ),
                  ),
                ),
                )
           
          ],
        ),);
  }
}

// ignore_for_file: inference_failure_on_instance_creation, cast_nullable_to_non_nullable, lines_longer_than_80_chars

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/transaction_model.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class YourTransactions extends StatelessWidget {
  YourTransactions({super.key});
  final ref = FirebaseDatabase.instance.ref('transaction/-NSkB-gd6BamSnTv4l0U');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp, right: 2.sp, top: 45.sp),
            child: SizedBox(
              // color: Colors.amber,
              height: 8.h,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenHome(),
                        ),
                      );
                    },
                    icon: Image.asset('assets/images/backButton.png'),
                  ),
                  Text(
                    FoodDeliveryConstantText.transaction,
                    style: FoodDeliveryTextStyles.homeScreenTitles,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          BlocBuilder<ApiHomeBloc, ApiHomeState>(
            builder: (context, state) {
              if(state is TransactionLoaded){
return Column(
                children: [
                  StreamBuilder(
                    stream: ref.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data!.snapshot.value != null) {
                        final snap = snapshot.data!.snapshot.value
                            as Map<Object?, Object?>;
                        final snapData = NSkBGd6BamSnTv4L0U.fromJson(snap);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.sp,
                                right: 25.sp,
                              ),
                              child: Text(
                                snapData.date1,
                                // "08 Mar 2023",
                                style: FoodDeliveryTextStyles.homeScreenTitles
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.sp,
                                right: 25.sp,
                              ),
                              child: SizedBox(
                                height: 26.h,
                                width: 85.w,
                                // color: Colors.amber,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: snapData.day1.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapData.day1[index].bank,
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .addressBookButtons
                                                  .copyWith(fontSize: 16),
                                            ),
                                            Text(
                                              ' ${FoodDeliveryConstantText.rupeesSymbol} ${snapData.day1[index].rate}',
                                              style: FoodDeliveryTextStyles
                                                  .addressBookButtons
                                                  .copyWith(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapData.day1[index].content,
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .editProfileTexts
                                                  .copyWith(fontSize: 14),
                                            ),
                                            Text(
                                              '${snapData.day1[index].time}pm',
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .editProfileTexts
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                        // Center(
                        //   child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,),
                        // );
                      }
                    },
                  ),
                  StreamBuilder(
                    stream: ref.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data!.snapshot.value != null) {
                        final snap = snapshot.data!.snapshot.value
                            as Map<Object?, Object?>;
                        final snapData = NSkBGd6BamSnTv4L0U.fromJson(snap);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.sp,
                                right: 25.sp,
                              ),
                              child: Text(
                                snapData.date2,
                                // "08 Mar 2023",
                                style: FoodDeliveryTextStyles.homeScreenTitles
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.sp,
                                right: 25.sp,
                              ),
                              child: SizedBox(
                                height: 26.h,
                                width: 85.w,
                                // color: Colors.amber,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: snapData.day2.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapData.day2[index].bank,
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .addressBookButtons
                                                  .copyWith(fontSize: 16),
                                            ),
                                            Text(
                                              ' ${FoodDeliveryConstantText.rupeesSymbol} ${snapData.day2[index].rate}',
                                              style: FoodDeliveryTextStyles
                                                  .addressBookButtons
                                                  .copyWith(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapData.day2[index].content,
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .editProfileTexts
                                                  .copyWith(fontSize: 14),
                                            ),
                                            Text(
                                              '${snapData.day2[index].time}pm',
                                              // "data",
                                              style: FoodDeliveryTextStyles
                                                  .editProfileTexts
                                                  .copyWith(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(); 
                        // Center(
                        //   child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,),
                        // );
                      }
                    },
                  ),
                ],
              );
              }else if (state is TransactionLoading){
              
                
                    return Shimmer.fromColors(
                       baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,

                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.sp,
                                  right: 25.sp,
                                ),
                                child:Container(
                                  height: 2.h,
                                  width: 20.w,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.sp,
                                  right: 25.sp,
                                ),
                                child: SizedBox(
                                  height: 60.h,
                                  width: 82.w,
                                  // color: Colors.amber,
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                  
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                             Container(
                                  height: 2.h,
                                  width: 82.w,
                                  color: Colors.white,
                                ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                                      Container(
                                  height: 2.h,
                                  width: 82.w,
                                  color: Colors.white,
                                ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                    );

                  }else{
                return 
                Center(child:CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,));
              }
              
              
            },
          ),
        ],
      ),
    ),);
  }
}

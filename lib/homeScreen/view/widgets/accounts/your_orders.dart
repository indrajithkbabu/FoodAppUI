// ignore_for_file: lines_longer_than_80_chars, prefer_if_elements_to_conditional_expressions, cast_nullable_to_non_nullable, inference_failure_on_instance_creation

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/orders_model.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class YourOrders extends StatelessWidget {
  YourOrders({super.key});
  final ref = FirebaseDatabase.instance.ref('orders/-NSnp-dAZDfNiMLNC0xq');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
                  FoodDeliveryConstantText.orders,
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
            if(state is OrdersLoadedData){
return StreamBuilder(
              stream: ref.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data!.snapshot.value != null) {
                  final snap =
                      snapshot.data!.snapshot.value as Map<Object?, Object?>;
                  final snapData = NSnpDAzDfNiMlnc0Xq.fromJson(snap);
                  return SizedBox(
                    height: 80.h,
                    width: 82.w,
                    // color: Colors.amber,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapData.yourOrders.length,
                      itemBuilder: (context, index) {
                        // print(snapData.yourOrders.length,);
                        return SizedBox(
                          height: 20.h,
                          width: 80.w,
                          // color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapData.yourOrders[index].hotelName,
                                    style:
                                        FoodDeliveryTextStyles.homeScreenTitles,
                                  ),
                                  snapData.yourOrders[index].deliveryStatus
                                          .contains('yes')
                                      ? Row(
                                          children: [
                                            const Text('Delivered'),
                                            Image.asset(
                                                'assets/images/tickMark.png',)
                                          ],
                                        )
                                      : const Text('pending')
                                ],
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                snapData.yourOrders[index].place,
                                style: FoodDeliveryTextStyles.editProfileTexts,
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              SizedBox(
                                height: 7.h,
                                width: 82.w,
                                // color: Colors.amber,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount:
                                      snapData.yourOrders[index].items.length,
                                  itemBuilder: (context, ind) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(snapData.yourOrders[index]
                                            .items[ind].food1,),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(snapData.yourOrders[index]
                                            .items[ind].food2,),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${snapData.yourOrders[index].date} at ${snapData.yourOrders[index].time}pm',
                                    style:
                                        FoodDeliveryTextStyles.editProfileTexts,
                                  ),
                                  Text(
                                    '${FoodDeliveryConstantText.rupeesSymbol} ${snapData.yourOrders[index].price}',
                                    style:
                                        FoodDeliveryTextStyles.homeScreenTitles,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                  // const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                }
              },
            );
            }else if(state is OrdersLoadingData){
              // print('loading');
              return Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: SizedBox(
                    height: 80.h,
                    width: 82.w,
                    // color: Colors.amber,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                     
                      itemBuilder: (context, index) {
                        // print(snapData.yourOrders.length,);
                        return SizedBox(
                          height: 20.h,
                          width: 80.w,
                          // color: Colors.amber,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 2.h,
                                    width: 82.w,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Container(
                                    height: 2.h,
                                    width: 30.w,
                                    color: Colors.white,
                                  ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              SizedBox(
                                height: 7.h,
                                width: 82.w,
                                // color: Colors.amber,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                
                                  itemBuilder: (context, ind) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                  //        Container(
                                  //   height: 2.h,
                                  //   width: 20.w,
                                  //   color: Colors.white,
                                  // ),
                                  //       SizedBox(
                                  //         height: 1.h,
                                  //       ),
                                            Container(
                                    height: 2.h,
                                    width: 20.w,
                                    color: Colors.white,
                                  ),
                                      ],
                                    );
                                  },
                                ),
                              ), SizedBox(
                                height: 1.5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 2.h,
                                    width: 82.w,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              );
              // Center(child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,),);

            }else{
              return Center(child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,),);
  
}
            
          },
        )
      ],
    ),);
  }
}

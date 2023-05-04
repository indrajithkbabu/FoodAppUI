// ignore_for_file: inference_failure_on_instance_creation, lines_longer_than_80_chars, prefer_if_elements_to_conditional_expressions, cast_nullable_to_non_nullable

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/add_address_model.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/login/view/widgets/reusable_widget.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AddressBook extends StatelessWidget {
  AddressBook({super.key});
  final ref = FirebaseDatabase.instance.ref('address/-NSiXED7cbVvNDVbbnky');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
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
                        FoodDeliveryConstantText.addressBook,
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
                  if(state is AddressBookLoaded){
                    return StreamBuilder(
                    stream: ref.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          !snapshot.hasError &&
                          snapshot.data!.snapshot.value != null) {
                        final snap = snapshot.data!.snapshot.value
                            as Map<Object?, Object?>;
                        final snapData = NSiXed7CbVvNdVbbnky.fromJson(snap);

                        return SingleChildScrollView(
                          child: SizedBox(
                            //  color: Colors.amber,
                            height: 72.h,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: snapData.addressBook.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.sp,
                                    right: 25.sp,
                                  ),
                                  child: SizedBox(
                                    height: 16.h,
                                    width: 85.w,
                                    //  color: Colors.amber,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 4.h,
                                          width: 20.w,
                                          //  color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              snapData.addressBook[index]
                                                      .locationType
                                                      .contains('office')
                                                  ? Image.asset(
                                                      'assets/images/workLoc.png',
                                                    )
                                                  : Image.asset(
                                                      'assets/images/home.png',
                                                    ),
                                              Text(
                                                snapData.addressBook[index]
                                                    .locationType,
                                                // 'Home',
                                                style: FoodDeliveryTextStyles
                                                    .homeScreenTitles
                                                    .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          snapData.addressBook[index].location,
                                          //  'Carnival infopark,phase 2,Infopark,Kochi',
                                          style: FoodDeliveryTextStyles
                                              .editProfileTexts,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Phone:${snapData.addressBook[index].phone}'
                                              ,
                                          // 'Phone:9876543210',
                                          style: FoodDeliveryTextStyles
                                              .editProfileTexts,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                          width: 40.w,
                                          //  color: Colors.red,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'EDIT',
                                                style: FoodDeliveryTextStyles
                                                    .addressBookButtons,
                                              ),
                                              Text(
                                                'DELETE',
                                                style: FoodDeliveryTextStyles
                                                    .addressBookButtons,
                                              ),
                                              Text(
                                                'SHARE',
                                                style: FoodDeliveryTextStyles
                                                    .addressBookButtons,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        //rtdb error
                        return Container();
                      //    Center(
                      //     child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor),
                      //   );
                      }
                    },
                  );
                  }else if (state is AddressBookLoading){
                    return Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: SizedBox(
                            //  color: Colors.amber,
                            height: 30.h,
                            // 72.h,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              // itemCount: snapData.addressBook.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 25.sp,
                                    right: 25.sp,
                                  ),
                                  child: SizedBox(
                                    height: 16.h,
                                    width: 85.w,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                           Container(
                                    height: 2.h,
                                    width: 15.w,
                                    color: Colors.white,
                                  ),
                                  SizedBox(height: 2.h,),
                                      Container(
                                    height: 2.h,
                                    width: 55.w,
                                    color: Colors.white,
                                  ),
                                   SizedBox(height: 1.h,),
                                   Container(
                                    height: 2.h,
                                    width: 35.w,
                                    color: Colors.white,
                                  ),SizedBox(height: 1.h,),
                                  Row(
                                    children: [
                                        Container(
                                    height: 2.h,
                                    width: 40.w,
                                    color: Colors.white,
                                  )
                                    ],
                                  )

                                      ],
                                    ),
                                    //  color: Colors.amber,
                                  //   child: Column(
                                  //     // mainAxisAlignment: MainAxisAlignment.start,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       SizedBox(
                                  //         height: 2.h,
                                  //         width: 10.w,
                                  //         //  color: Colors.red,
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //              Container(
                                  //   height: 2.h,
                                  //   width: 82.w,
                                  //   color: Colors.white,
                                  // )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         height: 1.h,
                                  //       ),
                                  //         Container(
                                  //   height: 2.h,
                                  //   width: 82.w,
                                  //   color: Colors.white,
                                  // ),
                                  //       SizedBox(
                                  //         height: 1.h,
                                  //       ),
                                  //         Container(
                                  //   height: 2.h,
                                  //   width: 82.w,
                                  //   color: Colors.white,
                                  // ),
                                  //       SizedBox(
                                  //         height: 1.h,
                                  //       ),
                                  //       SizedBox(
                                  //         height: 4.h,
                                  //         width: 40.w,
                                  //         //  color: Colors.red,
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               'EDIT',
                                  //               style: FoodDeliveryTextStyles
                                  //                   .addressBookButtons,
                                  //             ),
                                  //             Text(
                                  //               'DELETE',
                                  //               style: FoodDeliveryTextStyles
                                  //                   .addressBookButtons,
                                  //             ),
                                  //             Text(
                                  //               'SHARE',
                                  //               style: FoodDeliveryTextStyles
                                  //                   .addressBookButtons,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  ),
                                );
                              },
                            ),
                          ),
              );

                  }else{
                    return Center(child: CircularProgressIndicator(color: FoodDeliveryColor.buttonColor,),);
                  }
                  
                },
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: SizedBox(
              height: 6.5.h,
              width: 90.w,
              // color: Colors.red,
              child:
                  signInSignUpButton(context, () {}, const Text('Add address')),
            ),
          )
        ],
      ),
    );
  }
}

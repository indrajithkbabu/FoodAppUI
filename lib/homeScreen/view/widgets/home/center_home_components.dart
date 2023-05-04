// ignore_for_file: lines_longer_than_80_chars, prefer_const_constructors, cast_nullable_to_non_nullable, prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
List<FoodBanner>foodList=[];
class CenterHomeComponents extends StatelessWidget {
  CenterHomeComponents({super.key});
  // final ref = FirebaseDatabase.instance.ref('post/-NRWifmDJwiwH8wwvlhV');
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //   stream: ref.onValue,
    //   builder: (context, snapshot) {
        // if (snapshot.hasData &&
        //     !snapshot.hasError &&
        //     snapshot.data!.snapshot.value != null) {
    //       final snap = snapshot.data!.snapshot.value as Map<Object?, Object?>;
    //       final snapData = HomeModel.fromJson(snap);

          return BlocBuilder<ApiHomeBloc, ApiHomeState>(
            builder: (context, state) {
              if(state is ApiHomeLoaded){
final HomeApiModel userRes=state.result;

                return Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 22.sp),
                              child: Text(
                                FoodDeliveryConstantText.foodBannerTitle,
                                style: FoodDeliveryTextStyles.homeScreenTitles,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.sp),
                          child: SizedBox(
                            height: 12.h,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: userRes.data.nrWifmDJwiwH8WwvlhV.foodBanners.length,
                              // snapData.foodBanners.length,
                              // snapshot.data!.snapshot.children.length,
                              itemBuilder: (context, index) {
                                 final userData=userRes.data.nrWifmDJwiwH8WwvlhV.foodBanners;
                                 foodList=userData;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.sp),
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundColor: Colors.white70,
                                        backgroundImage: NetworkImage(
                                          userData[index].image,
                                          // snapData.foodBanners[index].image,
                                          // list[index]["image"].toString()
                                          // userr.demosub[index].image
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.sp),
                                      child: Text(
                                        userData[index].foodname,
                                        // list[index]["foodname"].toString(),
                                        // userr.demosub[index].foodname,
                                        style: FoodDeliveryTextStyles.homeScreenTitles
                                            .copyWith(
                                          fontSize: 12,
                                          color: const Color(0xFF696969),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    );
              }else if(state is ApiHomeLoading){
                return Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade300,
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 22.sp),
                      child: Container(
                        color: Colors.white,
                        height: 2.h,
                        width: 42.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.sp),
                  child: SizedBox(
                    height: 12.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.sp),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.white70,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          );
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
              // final HomeApiModel userRes=state.result;
             
            },
          
          );
        } 
    //   },
    // );
    // Column(
    //   children: [
    //  Row(
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: EdgeInsets.only(left: 22.sp),
    //             child: Text(
    //               FoodDeliveryConstantText.foodBannerTitle ,
    //               style: FoodDeliveryTextStyles.homeScreenTitles,
    //             ),
    //           )
    //         ],
    //       ),
    // SizedBox(
    //   height: 1.h,
    // ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 14.sp),
    //             child:
    //             SizedBox(
    //               //color: Colors.amber,
    // height: 12.h,
    // width: double.infinity,
    //               child:
    //               // BlocBuilder<DemoUserBloc, DemoUserState>(
    //               //   builder: (context, state) {
    //               //     if (state is DemoUserLoading) {
    //               //       return const Center(
    //               //         child: CircularProgressIndicator(),
    //               //       );
    //               //     }
    //               //     if (state is DemoUserLoaded) {
    //               //       // FoodDemoModel userr = state.user;

    //               //       //  print(userr.demosub.length);
    //               //       return
    //                     StreamBuilder(
    //                       stream: ref.onValue,
    //                       builder: (context, snapshot) {
    //                         if (snapshot.hasData &&
    //                             !snapshot.hasError &&
    //                             snapshot.data!.snapshot.value != null) {
    //                           final snap = snapshot.data!.snapshot.value
    //                               as Map<Object?, Object?>;
    //                           final snapData =
    //                               HomeModel.fromJson(snap );

    //                           return ListView.builder(
    //                             scrollDirection: Axis.horizontal,
    //                             itemCount: snapData.foodBanners.length,
    //                             // snapshot.data!.snapshot.children.length,
    //                             itemBuilder: (context, index) {
    //                               return Column(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceEvenly,
    //                                 children: [
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 5.sp),
    //                                     child: CircleAvatar(
    //                                       radius: 35,
    //                                       backgroundColor: Colors.white70,
    //                                       backgroundImage: NetworkImage(
    //                                         snapData.foodBanners[index].image,
    //                                         // list[index]["image"].toString()
    //                                         // userr.demosub[index].image
    //                                       ),
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding: EdgeInsets.only(left: 5.sp),
    //                                     child: Text(
    //                                       snapData.foodBanners[index].foodname,
    //                                       // list[index]["foodname"].toString(),
    //                                       // userr.demosub[index].foodname,
    //                                       style: FoodDeliveryTextStyles
    //                                           .homeScreenTitles
    //                                           .copyWith(
    //                                         fontSize: 12,
    //                                         color: const Color(0xFF696969),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ],
    //                               );
    //                             },
    //                           );
    //                         } else {
    //                           return const Center(
    //                             child: CircularProgressIndicator(),
    //                           );
    //                         }
    //                       },
    //                     )

    //                   // }
    //               //     return Container();
    //               //   },
    //               // ),
    //             ),
    //           ),
    // SizedBox(
    //   height: 2.h,
    // ),

    //   ],
    // );
  }
  

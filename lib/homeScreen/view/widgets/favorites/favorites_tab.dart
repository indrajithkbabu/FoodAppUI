// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/bottom_home_components.dart';
import 'package:foodieapp/homeScreen/view/widgets/top_bar.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
List<XploreResto>favList=[];
List<XploreResto>viewFavList=[];
class FavoritesTab extends StatefulWidget {
  FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
 
 @override
  void initState() {
  getFavorites();
  // print(getFavorites());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 20.sp),
            child: SizedBox(
              height: 9.h,
              child: const TopBar(),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.sp),
            child: Text(
              'Favorite Restaurants',
              style: FoodDeliveryTextStyles.homeScreenTitles,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          SizedBox(
            height: 72.h,
          
            
            child:FutureBuilder(
              future: getFavorites(),

              builder: (context, snapshot) {
                // viewFavList=await getFavorites();
             

                 if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      'no favorites added!!',
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                  );
                }
                   if (snapshot.hasData && !snapshot.hasError){
                   
                     return ListView.builder(
                  itemCount:snapshot.data!.length ,
                  itemBuilder: (context, index) {
                    print(snapshot.data![index].hotel);
                  
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: 15.sp,
                        left: 20.sp,
                        right: 20.sp,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              DecoratedBox(
                                decoration: const BoxDecoration(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    // snapshot.data[index]
                                 snapshot.data![index].image,
                                    height: 13.h,
                                    width: 87.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5.sp,
                                  right: 5.sp,
                                  top: 5.sp,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text( snapshot.data![index].hotel),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5.sp),
                                          child: Text(
                                              '${ snapshot.data![index].place} - ${ snapshot.data![index].distance}kms'),
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
                                        Text('${ snapshot.data![index].time} mins')
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
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            left: 20,
                            child: Text(
                              '${ snapshot.data![index].off} %off',
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
                            top: 3,
                            right: 5,
                            child: IconButton(
                              onPressed: () async{
                             
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Color(0xFFE6556F),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 58,
                            child: SizedBox(
                              height: 2.7.h,
                              width: 13.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE6556F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Container(),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 22,
                            bottom: 60,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2.sp),
                                  child: const Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Text(
                                   snapshot.data![index].rating.toString(),
                                  style: FoodDeliveryTextStyles.exploreRestoBanner
                                      .copyWith(
                                    fontSize: 14,
                                  ),
                                  // maxLines: 1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
                   }else{
                    return const Center(
                    child: CircularProgressIndicator(),
                  );
                   }
               
              },
            ),
          )
        ],
      ),
    );
  }
}

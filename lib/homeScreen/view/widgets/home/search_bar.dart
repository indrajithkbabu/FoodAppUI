// ignore_for_file: lines_longer_than_80_chars, unawaited_futures, avoid_returning_null_for_void

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/center_home_components.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<FoodBanner> filterFood = [];
  List<String> recentSearch = [];
  List<String> getRecentItems = [];

  final TextEditingController searchItemController = TextEditingController();
  @override
  void initState() {
    filterFood = foodList;

    getRecent();

    super.initState();
  }

  Future<List<String>> getRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String>? getRecentItems = prefs.getStringList('searchKey');
    // print('${getRecentItems} gett');
    return getRecentItems ?? [];
  }

  void filterFoodSearch(String query) {
    List<FoodBanner> filterFoodresult = [];
    if (query.isEmpty) {
      filterFoodresult = foodList;
    } else {
      filterFoodresult = foodList
          .where((e) => e.foodname.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      filterFood = filterFoodresult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp, right: 2.sp, top: 58.sp),
            child: SizedBox(
              height: 8.h,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      //  final SharedPreferences prefs = await SharedPreferences.getInstance();
                      //  prefs.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 25,
                    ),
                  ),
                  Text(
                    FoodDeliveryConstantText.searchNote,
                    style: FoodDeliveryTextStyles.homeScreenTitles,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.sp,
            ),
            child: SizedBox(
              height: 5.h,
              width: 90.w,
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (RawKeyEvent event) async {
                  if (event.logicalKey == LogicalKeyboardKey.enter) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    if (searchItemController.text.isEmpty) {
                      return null;
                    } else {
                      recentSearch = prefs.getStringList('searchKey') ?? [];
                      recentSearch.add(searchItemController.text);
                      if (recentSearch.length >= 4) {
                        recentSearch.removeAt(0);
                      }
                      prefs.setStringList('searchKey', recentSearch);
                    }

                    // print(
                    //     '${prefs.setStringList('searchKey', recentSearch)} sett');
                    setState(() {});
                  }
                },
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: searchItemController,
                  onChanged: filterFoodSearch,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: FoodDeliveryColor.buttonColor),
                    ),
                    hintText: 'Search',
                    hintStyle: FoodDeliveryTextStyles.editProfileTexts,
                    contentPadding: EdgeInsets.only(bottom: 2.sp),
                    prefixIcon: Image.asset(
                      'assets/images/3.0x/searchLoc.png',
                      color: FoodDeliveryColor.buttonColor,
                      scale: 2.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.sp, top: 15.sp),
            child: Text(
              'Popular dishes',
              style: FoodDeliveryTextStyles.homeScreenTitles
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: filterFood.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15.sp, top: 10.sp),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(filterFood[index].image),
                      ),
                      Text(
                        filterFood[index].foodname,
                        style: FoodDeliveryTextStyles.editProfileTexts,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.sp, top: 15.sp),
            child: Text(
              'Recent search',
              style: FoodDeliveryTextStyles.homeScreenTitles
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          // Expanded(
          //   flex: 4,
          //   child:ListView.builder(itemBuilder: (context, index) {

          //   },)
          // ),
          Expanded(
            flex: 4,
            child: FutureBuilder(
              future: getRecent(),
              builder: (context, snapshot) {
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return Padding(
                    padding: EdgeInsets.only(left: 15.sp, top: 10.sp),
                    child: Text(
                      'no search found !!',
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                  );
                }
                // print(snapshot.data);
                if (snapshot.hasData && !snapshot.hasError) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, idx) {
                      //  print(snapshot.data! .length);
                      final int index = snapshot.data!.length - idx - 1;

                      return Padding(
                        padding: EdgeInsets.only(left: 15.sp, top: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage(
                                    'assets/images/3.0x/recent.png',
                                  ),
                                  size: 20,
                                  color: Color(0xFF696969),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.sp,
                                  ),
                                  child: Text(
                                    snapshot.data![index],
                                    style: FoodDeliveryTextStyles
                                        .editProfileTexts
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
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

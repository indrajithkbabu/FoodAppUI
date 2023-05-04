// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_instance_creation

import 'package:flutter/material.dart';

import 'package:foodieapp/homeScreen/view/widgets/home/search_bar.dart';
import 'package:foodieapp/login/view/widgets/reusable_widget.dart';
import 'package:foodieapp/utils/constants.dart';

import 'package:sizer/sizer.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String? _value = 'Relevance';

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset('assets/images/location.png'),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Carnival Infopark',
                  style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                    fontSize: 13.sp,
                    color: const Color(0xFF1A2C42),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF1A2C42),
                  ),
                )
              ],
            ),
            Text(
              'Infopark campus,Kakanad,..',
              style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                fontSize: 10.sp,
                color: const Color(0xFF696969),
              ),
            )
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchBar(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Container(
              height: 5.h,
              width: 5.h,
              decoration: const BoxDecoration(
                color: Color(0xFF1D9F80),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Image.asset(
                  'assets/images/searchLoc.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            showBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 10.sp, right: 10.sp, top: 10.sp, bottom: 10.sp),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10.sp,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filter',
                              style: FoodDeliveryTextStyles.homeScreenTitles,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Relevance'),
                          Radio(
                            value: 'Relevance',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rating : High to Low'),
                          Radio(
                            value: 'Rating : High to Low',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rating : Low to High'),
                          Radio(
                            value: 'Rating : Low to High',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Time & Relevance'),
                          Radio(
                            value: 'Delivery Time & Relevance',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cost Low to High'),
                          Radio(
                            value: 'Cost Low to High',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cost High to Low'),
                          Radio(
                            value: 'Cost High to Low',
                            groupValue: _value,
                            onChanged: (String? value) {
                              setState(() {
                                _value = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      signInSignUpButton(context, () {}, Text('Apply'))
                    ],
                  ),
                );
              },
            );
          },
          child: Image.asset(
            'assets/images/settings.png',
            color: const Color(0xFF1A2C42),
          ),
        )
      ],
    );
  }
}

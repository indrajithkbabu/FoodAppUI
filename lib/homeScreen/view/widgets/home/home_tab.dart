// ignore_for_file: lines_longer_than_80_chars, cast_nullable_to_non_nullable, avoid_bool_literals_in_conditional_expressions, file_names

import 'package:flutter/material.dart';

import 'package:foodieapp/homeScreen/view/widgets/home/bottom_home_components.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/center_home_components.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/top_home_components.dart';
import 'package:foodieapp/homeScreen/view/widgets/top_bar.dart';
import 'package:sizer/sizer.dart';

class HomeTab extends StatefulWidget {
   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 20.sp),
            child: SizedBox(
              height: 9.h,
              child: const TopBar(),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const TopHomeComponents(),
          SizedBox(
            height: 2.h,
          ),
          Column(
            children: [
              CenterHomeComponents(),
          const BottomHomeComponents()],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
                              baseColor: Colors.grey.shade400,
                              highlightColor: Colors.grey.shade300,
                              child: SizedBox(
                                height: 65.h,
                                // color: Colors.amber,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  // itemCount:filterVegNonList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 51.w,
                                          // color: Colors.amber,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 2.h,
                                                width: 15.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 2.h,
                                                width: 24.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 2.h,
                                                width: 45.w,
                                              ),
                                              SizedBox(
                                                height: .5.h,
                                              ),
                                              Container(
                                                color: Colors.white,
                                                height: 2.h,
                                                width: 47.w,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 17.h,
                                          child: Container(
                                            height: 17.h,
                                            width: 28.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
  }
}
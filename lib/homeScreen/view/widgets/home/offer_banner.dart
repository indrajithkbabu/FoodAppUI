// ignore_for_file: lines_longer_than_80_chars, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class OfferBanner extends StatelessWidget {
  OfferBanner({
    required this.snapData,
    required this.indexx,
    this.isButtonBanner = false,
    super.key,
  });
  HomeApiModel snapData;
  int indexx;
  bool isButtonBanner;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 22.h,
          width: 78.w,
          decoration: BoxDecoration(
            //color:  Color(0xFFE6556F),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.network(
            snapData.data.nrWifmDJwiwH8WwvlhV.banners[indexx].image,
          ),
          
        ),
        
        Positioned(
          left: 30,
          bottom: 15,
          child: SizedBox(
            height: 3.5.h,
            width: 26.w,
            child: Visibility(
              visible: isButtonBanner,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  // 'ORDER NOW',
                  FoodDeliveryConstantText.orderNowButton,
                  style: 
                  FoodDeliveryTextStyles.componentBoxStyle.copyWith(
                    fontSize: 11.5,color: Colors.black,fontWeight: FontWeight.w500,
                  ),
                  
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

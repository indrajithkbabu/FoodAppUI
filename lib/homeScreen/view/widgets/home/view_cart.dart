// ignore_for_file: prefer_if_elements_to_conditional_expressions, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/model/cart_model.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class ViewCart extends StatefulWidget {
  ViewCart({required this.viewCartDatas, required this.userDatas, super.key});
  Map<String, CartModel> viewCartDatas;
  XploreResto userDatas;

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  @override
  Widget build(BuildContext context) {
    final List<CartModel> viewCartDataList =
        widget.viewCartDatas.values.toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.sp, right: 2.sp, top: 58.sp),
              child: SizedBox(
                // color: Colors.amber,
                height: 8.h,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset('assets/images/backButton.png'),
                    ),
                    Text(
                      widget.userDatas.hotel,
                      style: FoodDeliveryTextStyles.homeScreenTitles,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22.sp, top: 10.sp),
              child: Row(
                children: [
                  Icon(
                    Icons.access_alarm_outlined,
                    color: FoodDeliveryColor.buttonColor,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Delivery in ${widget.userDatas.time} mins',
                    style: FoodDeliveryTextStyles.homeScreenTitles
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: viewCartDataList.length,
              itemBuilder: (context, index) {

                return Padding(
                  padding: EdgeInsets.only(left: 20.sp, bottom: 10.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 22.w,
                        height: 18.h,
                        // 127

                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            viewCartDataList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.sp,
                        ),
                        child: SizedBox(
                          width: 60.w,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  viewCartDataList[index]
                                          .vegStatus
                                          .contains('false')
                                      ? Image.asset(
                                          'assets/images/Non veg.png',
                                        )
                                      : Image.asset(
                                          'assets/images/vegIcon.png',
                                        ),
                                  Container(
                                    width: 20.w,
                                    height: 3.h,
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      border: Border.all(
                                        color: FoodDeliveryColor.buttonColor,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(25),),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (viewCartDataList[index].quantity<=1
                                                            ) {
                                                setState(() {
                                                  widget.viewCartDatas.remove(
                                                      viewCartDataList[index]
                                                          .id
                                                          .toString(),);
                                                });
                                              } else {
                                                widget.viewCartDatas.update(
                                                    viewCartDataList[index]
                                                        .id
                                                        .toString(), (value) {
                                                        // print(value.dishName);
                                                  return CartModel(
                                                      content: value.content,
                                                      dishName: value.dishName,
                                                      id: value.id,
                                                      image: value.image,
                                                      price: value.price,
                                                      rating: value.rating,
                                                      vegStatus:
                                                          value.vegStatus,
                                                      quantity:
                                                          value.quantity - 1,);
                                                          
                                                });
                                              
                                              }
                                            });
                                          },
                                          child: SizedBox(
                                            height: 3.h,
                                            width: 3.h,
                                            child: Image.asset(
                                              'assets/images/minusButton.png',
                                              color:
                                                  FoodDeliveryColor.buttonColor,
                                              // fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          viewCartDataList[index]
                                              .quantity
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                FoodDeliveryColor.buttonColor,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              widget.viewCartDatas.update(
                                                  viewCartDataList[index]
                                                      .id
                                                      .toString(), (value) {
                                                return CartModel(
                                                    content: value.content,
                                                    dishName: value.dishName,
                                                    id: value.id,
                                                    image: value.image,
                                                    price: value.price,
                                                    rating: value.rating,
                                                    vegStatus: value.vegStatus,
                                                    quantity:
                                                        value.quantity + 1,);
                                              });
                                          
                                            });
                                          },
                                          child: SizedBox(
                                            height: 3.h,
                                            width: 3.h,
                                            child: Image.asset(
                                              'assets/images/add.png',
                                              color:
                                                  FoodDeliveryColor.buttonColor,
                                              // fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                
                                children: [
                                  Text(
                                    viewCartDataList[index].dishName,
                                    style: FoodDeliveryTextStyles
                                        .homeScreenTitles
                                        .copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    viewCartDataList[index].quantity.toString(),
                                    style: FoodDeliveryTextStyles
                                        .homeScreenTitles
                                        .copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' ${FoodDeliveryConstantText.rupeesSymbol}${viewCartDataList[index].price}',
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    '${FoodDeliveryConstantText.rupeesSymbol} ${viewCartDataList[index].quantity * viewCartDataList[index].price}',
                                    style: FoodDeliveryTextStyles
                                        .homeScreenTitles
                                        .copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/3.0x/addItem.png',
                                    scale: 2.4,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8.sp,
                                    ),
                                    child: Text(
                                      'Add more items',
                                      style: FoodDeliveryTextStyles
                                          .homeScreenTitles
                                          .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/3.0x/addItem.png',
                                    scale: 2.4,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 8.sp,
                                    ),
                                    child: Text(
                                      'Add cooking instructions',
                                      style: FoodDeliveryTextStyles
                                          .homeScreenTitles
                                          .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Image.network(viewCartDataList[index].vegStatus)
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 10.sp, right: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FoodDeliveryConstantText.offerBenefits,
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 35.w,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 4.h,
                                width: 4.h,
                                child: Image.asset(
                                    'assets/images/offerpercent.png',),),
                            Text(
                              FoodDeliveryConstantText.addCoupon,
                              style: FoodDeliveryTextStyles.homeScreenTitles
                                  .copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child: Image.asset('assets/images/trailing.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    FoodDeliveryConstantText.tip,
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    FoodDeliveryConstantText.tipDescription,
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    // color: Colors.amber,
                    width: 80.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 3.h,
                          width: 4.h,
                          child: Text(
                            '${FoodDeliveryConstantText.rupeesSymbol} 10',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 3.h,
                          width: 4.h,
                          child: Text(
                            '${FoodDeliveryConstantText.rupeesSymbol} 20',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 3.h,
                          width: 4.h,
                          child: Text(
                            '${FoodDeliveryConstantText.rupeesSymbol} 30',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 3.h,
                          width: 5.h,
                          child: Text(
                            'other',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    FoodDeliveryConstantText.billdetails,
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FoodDeliveryConstantText.itemTotal,
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${FoodDeliveryConstantText.rupeesSymbol}140',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${FoodDeliveryConstantText.deliveryFee} ~ 4.6 km',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${FoodDeliveryConstantText.rupeesSymbol}45',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Text(FoodDeliveryConstantText.saveDeliveryFee,
                          style:
                              FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(FoodDeliveryConstantText.deliveryTip,
                              style: FoodDeliveryTextStyles.homeScreenTitles
                                  .copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),),
                          Text('Add tip',
                              style: FoodDeliveryTextStyles.homeScreenTitles
                                  .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          FoodDeliveryColor.logoutButtonColor,),)
                        ],
                      ),
                      SizedBox(
                        height: .5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FoodDeliveryConstantText.govtTax,
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text('${FoodDeliveryConstantText.rupeesSymbol}6.64',
                              style: FoodDeliveryTextStyles.homeScreenTitles
                                  .copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),),
                        ],
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total pay',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${FoodDeliveryConstantText.rupeesSymbol}140',
                            style: FoodDeliveryTextStyles.homeScreenTitles
                                .copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'Cancellation',
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    FoodDeliveryConstantText.cancelDescription,
                    style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        //  cartData.values.first.quantity. toString(),
                        '${FoodDeliveryConstantText.rupeesSymbol} 140',
                        // cartData,
                        style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: FoodDeliveryColor.buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Proceed to pay',
                            style: FoodDeliveryTextStyles.addressBookButtons
                                .copyWith(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

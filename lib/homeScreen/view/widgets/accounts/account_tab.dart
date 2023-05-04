// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, lines_longer_than_80_chars, inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/food_model.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/address_book.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/edit_profile.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/help.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/notifications.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/settings_edit_profile.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/table_reservations.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/your_orders.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/your_transactions.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:foodieapp/utils/image_assets.dart';
import 'package:sizer/sizer.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.sp, right: 2.sp, top: 20.sp),
            child: SizedBox(
              height: 9.h,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 12.sp,
                  right: 15.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/images/propic.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 4.sp,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'KIM JONG-UN',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'SpaceGrotesk',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A2C42),
                                ),
                              ),
                              Text(
                                'kimjongun@gmail.com',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'SpaceGrotesk',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1A2C42),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),);
                      },
                      icon: Image.asset('assets/images/editIcon.png'),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            // height: 130,
            height: 15.5.h,

            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF1D9F80),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: ImageIcon(
                        AssetImage('assets/icons/fav.png'),
                        color: Color(0xFF1D9F80),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp),
                      child: const Text('Liked'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: ImageIcon(
                        AssetImage('assets/images/favResto.png'),
                        color: Color(0xFF1D9F80),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp),
                      child: const Text('Fav restaurants'),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Settings(),
                            ),);
                      },
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        child: ImageIcon(
                          AssetImage('assets/images/settingsIcon.png'),
                          color: Color(0xFF1D9F80),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.sp),
                      child: const Text('Settings'),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 45.h,
            // color: Colors.amber,
            child: ListView.builder(
              itemCount: accountNavBarList.length,
              itemBuilder: (context, index) {
                final accTitles = accountNavBarList[index];
                return InkWell(
                  onTap: () {
                    if(index==0){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>YourOrders(),));
                       context.read<ApiHomeBloc>().add(FetchOrdersData());
                    }else if(index==1){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => AddressBook(),));
                      context.read<ApiHomeBloc>().add(FetchAddressData());
                    }else if(index==2){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => YourTransactions(),));
                       context.read<ApiHomeBloc>().add(FetchTransactionData());
                    }
                    else if(index==3){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const TableReservations(),));
                    }
                    else if(index==4){
                       Navigator.push(context,MaterialPageRoute(builder: (context) => const Notifications(),));
                    }else{
                       Navigator.push(context,MaterialPageRoute(builder: (context) => const Help(),));
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           DetailedScreen(detailedData: accTitles),
                    //     ));
                  },
                  child: ListTile(
                    leading: accTitles.icon,
                    title: Text(
                      accTitles.accountDetails!,
                      style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(
                          0xFF1A2C42,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage(ImageAssets.accountTrailing),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// ignore_for_file: require_trailing_commas, lines_longer_than_80_chars, inference_failure_on_instance_creation, avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/login/view/screens/screenLogin.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:foodieapp/utils/sharedpref.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.sp, right: 2.sp, top: 45.sp),
            child: SizedBox(
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
                      FoodDeliveryConstantText.settings,
                      style: FoodDeliveryTextStyles.homeScreenTitles,
                    ),
                  ],
                ),
                ),
          ),SizedBox(height: 2.h,),
          InkWell(
            onTap: (){
    _showMyDialog(context,true);
            },
            child: SizedBox(width: 92.w,
              child: ListTile(
                leading: Image.asset('assets/images/logout.png'),
                title: const Text('Logout'),
                trailing: Image.asset('assets/images/trailing.png'),
              ),
            ),
          ),SizedBox(height: 1.h,),
           InkWell(
            onTap: () {
               _showMyDialog(context,false);
            },
             child: SizedBox(width: 92.w,
               child: ListTile(
                leading: Image.asset('assets/images/deleteAcc.png'),
                title: const Text('Delete account'),
                 trailing: Image.asset('assets/images/trailing.png'),
                       ),
             ),
           )
        ],
      ),
    );
  }
  Future<void> _showMyDialog(
    BuildContext context,
  bool isLogout
  )async{

  return showDialog(context: context,
  builder: (context) {
    return AlertDialog(
      content: SizedBox(
        height: 14.h,
        width: 100.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.sp),
              child: CircleAvatar(
                radius: 28,
                backgroundColor:isLogout? FoodDeliveryColor .buttonColor:FoodDeliveryColor.logoutButtonColor,
                child: Image.asset(isLogout?'assets/images/logout.png':'assets/images/deleteAcc.png',color: Colors.white,),
              ),
            ),
            DecoratedBox(
              // height: 200,
              // width: 300,
              decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child:
              //  isLogout? Text("logout"):
              Text(isLogout?FoodDeliveryConstantText.logoutCommand:FoodDeliveryConstantText.deleteCommand,
              style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(fontSize: 15)
              )),
            
          ],
        ),
      ),
      actions: [
        Padding(
          padding:  EdgeInsets.only(bottom: 15.sp),
          child: Center(
            child: SizedBox(
              height: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  InkWell(
                    onTap: () {
                     isLogout?  clearToken(context: context).then((value) {
                       Navigator.push(context,MaterialPageRoute(builder: (context) => ScreenLogin(),));

                     }):
                     //delete account
                     debugPrint('delete account');
                    },
                    child: Container( 
                      // height: 48,
                      height:5.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        color: FoodDeliveryColor.logoutButtonColor,
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),child:Center(child: Text(isLogout?'logout':'Yes, delete my account',style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                        color: Colors.white
                      ))),
                    ),
                  ),
                  
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.sp),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back',style: FoodDeliveryTextStyles.editProfileTexts.copyWith(
                          color: FoodDeliveryColor.logoutButtonColor
                        ),),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      
      ],
    );
  },
    
   
  );
}
}

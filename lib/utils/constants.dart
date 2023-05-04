import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//textStyles
class FoodDeliveryTextStyles {
  static TextStyle headingStyle = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textFieldStyle = TextStyle(
    color: const Color(0xFF696969),
    fontSize: 11.sp,
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonTextStyle = TextStyle(
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );

  static TextStyle componentBoxStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );

  static TextStyle componentBoxSubtleStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'QuickSand',
  );

  static TextStyle homeScreenTitles = const TextStyle(
    fontSize: 16,
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A2C42),
  );

  static TextStyle exploreRestoBanner = const TextStyle(
    fontSize: 18,
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w600,
    color: Color(0xFFFFFFFF),
  );
 static TextStyle editProfileTexts =  TextStyle(
    fontSize: 11.sp,
    fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w400,
    color: const Color(0xFF696969),
  );
static TextStyle addressBookButtons=const TextStyle(
  fontSize: 12,
  fontFamily: 'SpaceGrotesk',
    fontWeight: FontWeight.w500,
    color: Color(0xFF1D9F80),
);
}

//colors
class FoodDeliveryColor {
  static Color buttonColor = const Color(0xFF1D9F80);
  static Color logoutButtonColor=const Color(0xFFE6556F);

  static LinearGradient gradient =const LinearGradient(
                                          colors: [
                                            Colors.transparent,
                                            Colors.transparent,
                                            Colors.black87,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [0, .5, 1.0],
                                        );
}

// constantTexts
class FoodDeliveryConstantText {
  static String titleText = 'Sign In';
  static String titleSignUpText = 'Sign Up';
  static String rupeesSymbol = '\u{20B9}';
  static String foodBannerTitle='Whats on your mind?';
  static String orderNowButton='ORDER NOW';
  static String exploreRestoTitle='restaurants to explore';
  static String editProfile='Edit Profile';
  static String changePhoto='Change photo';
  static String name='Name';
  static String phone='Phone number';
  static String email='Email';
  static String dob='Date of Birth';
  static String gender='Gender';
  static String settings='Settings';
  static String addressBook='Address book';
    static String transaction='Your transactions';
     static String orders='Your orders';  
  static String notifications='Notifications';
  static String offerBenefits='Offers & Benefits';
  static String tip='Tip your deliver partner';
  static String addCoupon='Apply coupon';
  static String menu='menu';
   static String billdetails='Bill details';
   static String govtTax='Govt Taxes & Other Charges';
   static String deliveryTip='Delivery tip';
    static String itemTotal='Item total';
     static String deliveryFee='Delivery Fee';
     static String searchNote='Search for dishes';
   static String rs='₹';
   static String cancelDescription='''
Lorem Ipsum is simply dummy text of the printing  
and typesetting industry. Lorem Ipsum has been 
the industry's standard dummy text.''';

   static String saveDeliveryFee='''
Save ₹10 on Delivery fee by 
ordering above ₹159''';

  static String tipDescription='''
Lorem Ipsum is simply dummy text of the printing
 and typesetting industry.''';

  static String logoutCommand='''
Are you sure you want to logout
               your account?''';
  static String deleteCommand=   '''
Are you sure you want to delete
               your account?''';   

}

class SizedBoxx{
  static SizedBox heightSize=SizedBox(height: 15.sp,);
}

// ignore_for_file: inference_failure_on_instance_creation, require_trailing_commas, lines_longer_than_80_chars, unnecessary_null_comparison, type_annotate_public_apis

import 'package:flutter/material.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/drop_down.dart';
import 'package:foodieapp/homeScreen/view/widgets/accounts/widget_reuse.dart';
import 'package:foodieapp/login/view/widgets/reusable_widget.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  // final TextEditingController _genderController = TextEditingController();
  final GlobalKey<FormState> _formKeyy = GlobalKey();
  // Initial Selected Value
String? dropdownvalue='Male' ;

// List of items in our dropdown menu
var items = [	
	'Male',
	'Female',

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      //  appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
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
                    FoodDeliveryConstantText.editProfile,
                    style: FoodDeliveryTextStyles.homeScreenTitles,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/images/propic.png',
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                FoodDeliveryConstantText.changePhoto,
                style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                    color: FoodDeliveryColor.buttonColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp),
              ),
            ],
          ),
          Form(
            key: _formKeyy,
            child: Padding(
              padding: EdgeInsets.only(top: 15.sp, left: 15.sp, right: 15.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FoodDeliveryConstantText.name,
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                    SizedBox(
                        height: 5.5.h,
                        child: editProfileTextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                            contentPadding: EdgeInsets.only(top: 25.sp,bottom: 5.sp),
                          onValidate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'This field is required';
                            } else {
                              return null;
                            }
                          },
                        )),
                    SizedBoxx.heightSize,
                    Text(
                      FoodDeliveryConstantText.phone,
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                    SizedBox(
                        height: 5.5.h,
                        child: editProfileTextFormField(
                        contentPadding: EdgeInsets.only(top: 25.sp,bottom: 5.sp),
                          onValidate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'This field is required';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          suffixIcon: Image.asset(
                              'assets/images/editProfileEditIcon.png'),
                          prefficIcon:
                              Image.asset('assets/images/countryFlag.png'),
                        )),
                    SizedBoxx.heightSize,
                    Text(
                      FoodDeliveryConstantText.email,
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                    SizedBox(
                        height: 5.5.h,
                        child: editProfileTextFormField(
                          contentPadding: EdgeInsets.only(top: 25.sp,bottom: 5.sp),
                          onValidate: (value) {
                            if (value!.isEmpty || value == null) {
                              return 'This field is required';
                            } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
                            ).hasMatch(value)) {
                              return 'Enter valid Email Id';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          suffixIcon: Image.asset(
                              'assets/images/editProfileEditIcon.png'),
                        )),
                    SizedBoxx.heightSize,
                    Text(
                      FoodDeliveryConstantText.dob,
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                    SizedBox(
                        height: 5.5.h,
                        child: editProfileTextFormField(
                               contentPadding: EdgeInsets.only(top: 25.sp,bottom: 5.sp),
                            onValidate: (value) {
                              if (value!.isEmpty || value == null) {
                                return 'This field is required';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.phone,
                            controller: _dobController)),
                    SizedBoxx.heightSize,
                    Text(
                      FoodDeliveryConstantText.gender,
                      style: FoodDeliveryTextStyles.editProfileTexts,
                    ),
                    SizedBox(
                        height: 7.h,
                        child: 	const DropdownSelection()
                        // editProfileTextFormField(
                        //   contentPadding: EdgeInsets.only(top: 25.sp,bottom: 5.sp),
                        //   suffixIcon: InkWell(
                        //     onTap: (){
                        //       DropDown();
                        //     },
                        //     child: Image.asset('assets/images/downArrow.png')),
                        //   suffixIconConstraints: const BoxConstraints(
                        //     minWidth: 5,
                        //     minHeight: 25,
                        //   ),
                        //   onValidate: (value) {
                        //       if (value!.isEmpty || value == null) {
                        //         return 'This field is required';
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        // )
                        ),
                    SizedBox(
                      height: 5.h,
                    ),
                    signInSignUpButton(context, () {
                      if (validateForm()) {
                        debugPrint('validated');
                      }
                    }, const Text('Update'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  bool validateForm() {
    final form = _formKeyy.currentState;

    if (form!.validate()) {
      return true;
    }
    return false;
  }
}

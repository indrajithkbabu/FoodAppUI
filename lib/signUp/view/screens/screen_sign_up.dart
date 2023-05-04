// ignore_for_file: lines_longer_than_80_chars, must_be_immutable, avoid_redundant_argument_values, unnecessary_null_comparison, inference_failure_on_instance_creation, require_trailing_commas, noop_primitive_operations

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/firebase/firebase_services.dart';
import 'package:foodieapp/homeScreen/view/screens/screen_home.dart';
import 'package:foodieapp/login/view/screens/screenLogin.dart';
import 'package:foodieapp/login/view/widgets/reusable_widget.dart';
import 'package:foodieapp/signUp/bloc/bloc/api_sign_up_bloc.dart';
import 'package:foodieapp/signUp/bloc/sign_up_bloc.dart';


import 'package:foodieapp/utils/constants.dart';

import 'package:sizer/sizer.dart';

class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  final TextEditingController _userNameTextController = TextEditingController();

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  FocusNode fieldOne = FocusNode();

  FocusNode fieldTwo = FocusNode();

  FocusNode fieldThree = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            //color: Colors.grey,

            height: height,
            //96.8.h,
            // width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: 26.h,
                    // color: Colors.amber,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/topBg.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(
                    'assets/images/signInTop.png',
                    width: height,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 17.h,
                    child: Image.asset(
                      'assets/images/signInBottom.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 22.h,
                  bottom: 0,
                  child: SizedBox(
                      height: 40.h,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.h),
                            child: Text(
                              FoodDeliveryConstantText.titleSignUpText,
                              style: FoodDeliveryTextStyles.headingStyle,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              left: 2.h,
                              right: 2.h,
                            ),
                            child: SizedBox(
                              //height: 6.5.h,
                              child: reusableTextField(
                                text: 'Username',
                                icon: Icons.person_2_rounded,
                                isPasswordType: false,
                                isObscure: false,
                                focusNode: fieldOne,
                                onValidate: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Username required';
                                  }
                                  else if (!RegExp(
                                          r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$',)
                                      .hasMatch(value)) {
                                    return 'Enter a valid username';
                                  }
                                  return null;
                                },
                                onFieldSub: (value) {
                                  FocusScope.of(context).requestFocus(fieldTwo);
                                },
                                controller: _userNameTextController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              left: 2.h,
                              right: 2.h,
                            ),
                            child: SizedBox(
                              //height: 6.5.h,
                              child: reusableTextField(
                                text: 'Email',
                                icon: Icons.email,
                                isPasswordType: true,
                                isObscure: false,
                                focusNode: fieldTwo,
                                onFieldSub: (value) {
                                  FocusScope.of(context)
                                      .requestFocus(fieldThree);
                                },
                                onValidate: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Email address required';
                                  } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
                                  ).hasMatch(value)) {
                                    return 'Enter valid Email Id';
                                  }
                                  return null;
                                },
                                controller: _emailTextController,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: .5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 1.h,
                              left: 2.h,
                              right: 2.h,
                            ),
                            child: SizedBox(
                              // height: 6.5.h,
                              child: BlocBuilder<SignUpBloc, SignUpState>(
                                builder: (context, state) {
                                  return reusableTextField(
                                    text: 'Password',
                                    icon: Icons.lock_outline,
                                    isPasswordType: true,
                                    controller: _passwordTextController,
                                    isObscure: state.onActive,
                                    focusNode: fieldThree,
                                    onValidate: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return 'Password required';
                                      } else if (value.length < 8) {
                                        return 'Enter valid password of atleast 8 letters';
                                      }
                                      else if (!RegExp(
                                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                          .hasMatch(value)) {
                                        return 'uppercase,lowercase,digit,and special character must be included';
                                      }
                                      return null;
                                    },
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<SignUpBloc>()
                                            .add(ShowPasswd());
                                      },
                                      child: const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          signInSignUpButton(context, () {
                            if (validateForm()) {
                              context.read<ApiSignUpBloc>().add(SendData(
                                  _userNameTextController.text.toString(),
                                  _emailTextController.text.toString(),
                                  _passwordTextController.text.toString(),
                                  // context
                                  
                                  ));

                              // FirebaseServ().createUser(
                              //     context: context,
                              //     email: _emailTextController.text,
                              //     password: _passwordTextController.text,);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenHome(),));
                            }
                          }, BlocBuilder<ApiSignUpBloc, ApiSignUpState>(
                            builder: (context, state) {
                              if (state is ApiSignUpLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                );
                              } else if (state is ApiSignUpError) {
                                return Center(
                                  child: Text(
                                    'Error!!!',
                                    style:
                                        FoodDeliveryTextStyles.buttonTextStyle,
                                  ),
                                );
                              } else {
                                return Text(
                                  FoodDeliveryConstantText.titleSignUpText,
                                  style: FoodDeliveryTextStyles.buttonTextStyle,
                                );
                              }
                            },
                          )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 1.5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: FoodDeliveryTextStyles.textFieldStyle,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ScreenLogin(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: FoodDeliveryTextStyles
                                        .homeScreenTitles
                                        .copyWith(
                                      fontSize: 11.sp,
                                      color: const Color(0xFF1D9F80),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.h),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Or Sign up with',
                                style: FoodDeliveryTextStyles.textFieldStyle,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2.h),
                                child: InkWell(
                                  onTap: () {
                                    FirebaseServ()
                                        .signInWithApple()
                                        .then((value) {
                                      // print(value!.user!.email);
                                      if (value != null) {
                                        debugPrint('apple login');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ScreenHome(),
                                          ),
                                        );
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                  child: Platform.isIOS
                                      ? Container(
                                          height: 6.h,
                                          width: 6.h,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF000000),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Image.asset(
                                              'assets/images/apple.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 2.h),
                                child: InkWell(
                                  onTap: () async {
                                    await FirebaseServ()
                                        .signInWithFacebook()
                                        .then((value) {
                                      if (value != null) {
                                        debugPrint('fb login');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ScreenHome(),
                                          ),
                                        );
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: 6.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1877F2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Image.asset(
                                        'assets/images/fbF.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 2.h),
                                child: InkWell(
                                  onTap: () async {
                                    await FirebaseServ()
                                        .signInWithGoogle()
                                        .then((value) {
                                      if (value != null) {
                                        debugPrint('google login');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ScreenHome(),
                                          ),
                                        );
                                      } else {
                                        return;
                                      }
                                    });
                                  },
                                  child: Container(
                                    height: 6.h,
                                    width: 6.h,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFD0463B),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Image.asset(
                                        'assets/images/googleG.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
//
        ),
      ),
    );
  }

  bool validateForm() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      return true;
    }
    return false;
  }
}

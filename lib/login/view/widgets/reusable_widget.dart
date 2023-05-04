// ignore_for_file: inference_failure_on_function_return_type, avoid_positional_boolean_parameters, avoid_dynamic_calls, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:sizer/sizer.dart';

TextFormField reusableTextField({
  required String text,
  required IconData icon,
  required TextEditingController controller,
  required bool isPasswordType,
  required bool isObscure,
  FocusNode? focusNode,
  Widget? suffixIcon,
  Function(String)? onFieldSub,
  String? Function(String?)? onValidate,
}) {
  return TextFormField(
    validator: onValidate,
    focusNode: focusNode,
    onFieldSubmitted: onFieldSub,
    controller: controller,
    obscureText: isObscure,
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(top: 15),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red.shade200, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
      ),
      //labelText:text ,
      // helperText: text,
      hintText: text,
      hintStyle: FoodDeliveryTextStyles.textFieldStyle,
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      suffixIcon: suffixIcon,
    ),
  );
}

SizedBox signInSignUpButton(
  BuildContext context,
  // bool isLogin,
  Function onTap,
  Widget text,
) {
  return SizedBox(
    height: 6.5.h,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
      child: ElevatedButton(
        onPressed: () {
          // print("signup");
          onTap();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: FoodDeliveryColor.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: text,
      ),
    ),
  );
}

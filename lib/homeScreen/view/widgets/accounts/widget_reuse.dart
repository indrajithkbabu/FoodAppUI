import 'package:flutter/material.dart';


TextFormField editProfileTextFormField(
    {Widget? suffixIcon,
    Widget? prefficIcon,
    BoxConstraints? suffixIconConstraints,
    TextEditingController? controller,
    String? Function(String?)? onValidate,
    TextInputType? keyboardType,
    EdgeInsetsGeometry? contentPadding,}) {
  return TextFormField(
    controller: controller,
    validator: onValidate,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      prefixIcon: prefficIcon,
      suffixIconConstraints: suffixIconConstraints,
      contentPadding: contentPadding,
    ),
  );
}

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      maxLines: maxLines,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle:
              const TextStyle(color: Constants.hintTextColor, fontSize: 18),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Constants.textFieldBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none)),
    );
  }
}

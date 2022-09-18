import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDropDown<T> extends StatelessWidget {
  final T value;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;

  const CustomDropDown(
      {Key? key,
      required this.value,
      required this.hint,
      required this.items,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Constants.textFieldBackgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
              dropdownColor: Constants.textFieldBackgroundColor,
              isExpanded: true,
              icon: const Icon(CupertinoIcons.chevron_down,
                  color: Constants.hintTextColor),
              iconSize: 20,
              value: value,
              hint: Text(
                hint,
                style: const TextStyle(
                    color: Constants.hintTextColor, fontSize: 18),
              ),
              onChanged: onChanged,
              items: items)),
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';

class AppTextformfield extends StatelessWidget {
  final TextEditingController? field_controller;
  final errormsg;
  final labelText;
  final hintText;
  final bool isValidate;
  final Widget? suffix;
  final bool readOnly;
  final onTap;
  final initialValue;
  final TextInputType? keyboardType;
  // ignore: prefer_const_constructors_in_immutables
  AppTextformfield(
      {Key? key,
      this.field_controller,
      this.errormsg,
      required this.labelText,
      required this.hintText,
      this.isValidate = true,
      this.suffix,
      this.readOnly = false,
      this.onTap,
      this.keyboardType,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(
              fontSize: 15,
              color: appBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 3),
          TextFormField(
            keyboardType: keyboardType,
            readOnly: readOnly,
            controller: field_controller,
            onTap: onTap,
            initialValue: initialValue,
            validator: (value) {
              if (isValidate == true) {
                if (value == null || value.isEmpty) {
                  return errormsg;
                }
                return null;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffix,
              border: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';

// ignore: must_be_immutable
class AppTextFormFiled extends StatelessWidget {
  AppTextFormFiled({
    super.key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 80,
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Color(0xff8a8c8d)),
            hintText: hint,
            hintStyle: TextStyle(color: Color.fromARGB(105, 138, 140, 141)),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: validator),
    );
  }
}

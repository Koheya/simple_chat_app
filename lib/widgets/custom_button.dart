// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomButton({this.onTap,required this.buttonText});
  String? buttonText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            buttonText!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}

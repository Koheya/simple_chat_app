// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CustomFormField extends StatelessWidget {
  String? hintText;
  CustomFormField({super.key, this.onChanged,required  this.hintText , this.obSecureText = false});
  Function(String)? onChanged;
 bool? obSecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(style: const TextStyle(
      color: Colors.white
    ),
      validator: (data)
      {
        if(data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      obscureText: obSecureText!,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}

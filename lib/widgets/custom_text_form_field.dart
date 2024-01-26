import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, required this.hintText, required this.onSaveValue});

  final String hintText;
  Function(String?)? onSaveValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return "Please Enter $hintText";
          }
          return null;
        },
        onSaved: onSaveValue,
        onChanged: onSaveValue,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 19,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.blue,
            ))),
      ),
    );
  }
}

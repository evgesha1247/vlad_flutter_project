import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  const MyTextField(
      {super.key, this.hintText = '', this.icon, this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(

      child: TextField(
        minLines: 1,
        maxLines: 10,
        controller: controller,
        scrollPadding: EdgeInsets.zero,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 18),
          prefixIcon: icon != null ? Icon(icon, size: 18) : null,
          border: const OutlineInputBorder(),

          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
TextField tField(String title, TextEditingController controller){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: title,
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red)),
      )
  );
}
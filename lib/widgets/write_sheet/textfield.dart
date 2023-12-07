import 'package:flutter/material.dart';

class WriterTextField extends StatelessWidget {
  final controller = TextEditingController();
  final String hintext;
  final Icon icon;
  WriterTextField(
      {required controller,
      required this.hintext,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: const EdgeInsets.all(15),
        hintText: hintext,
        hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.green,
            width: 1.9,
          ),
        ),
      ),
    );
  }
}

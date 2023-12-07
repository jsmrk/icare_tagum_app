import 'package:flutter/material.dart';

class WriteTextFormField extends StatelessWidget {
  final controller = TextEditingController();
  WriteTextFormField({required controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 7,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
        hintText: 'Write Report Description',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
              color: Colors.grey, width: 3.0), // Thicker border when focused
        ),
      ),
    );
  }
}

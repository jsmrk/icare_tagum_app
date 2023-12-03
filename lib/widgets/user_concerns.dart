import 'package:flutter/material.dart';

class UserConcerns extends StatelessWidget {
  const UserConcerns({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 19,
        ),
        child: Text('ashdjkashd'),
      );
    });
  }
}

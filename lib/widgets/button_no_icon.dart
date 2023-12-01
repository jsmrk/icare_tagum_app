import 'package:flutter/material.dart';

class ButtonWithoutIcon extends StatelessWidget {
  const ButtonWithoutIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 49,
          width: 151,
          padding: const EdgeInsets.all(15),
          color: Colors.green,
          child: const Text(
            'Continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

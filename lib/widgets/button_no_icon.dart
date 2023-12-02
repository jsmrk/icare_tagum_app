import 'package:flutter/material.dart';

class ButtonWithoutIcon extends StatelessWidget {
  final void Function() navigateTo;

  const ButtonWithoutIcon({super.key, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateTo,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 37,
          width: 151,
          alignment: Alignment.center,
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

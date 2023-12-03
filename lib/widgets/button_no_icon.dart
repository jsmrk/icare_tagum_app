import 'package:flutter/material.dart';

class ButtonWithoutIcon extends StatelessWidget {
  final void Function() navigateTo;
  final Color bgColor;
  final Color txtColor;
  final double curvedSize;
  final String buttonText;

  const ButtonWithoutIcon({
    super.key,
    required this.navigateTo,
    required this.bgColor,
    required this.buttonText,
    required this.curvedSize,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateTo,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(curvedSize),
        child: Container(
          height: 37,
          width: 151,
          alignment: Alignment.center,
          color: bgColor,
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: txtColor,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

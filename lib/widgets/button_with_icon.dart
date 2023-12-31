import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  // final void Function() navigateTo;
  final Color bgColor;
  final Color txtColor;
  final Color iconColor;
  final void Function() onTapFunction;

  const ButtonWithIcon(
      {super.key,
      required this.bgColor,
      required this.txtColor,
      required this.iconColor,
      required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 37,
          width: 255,
          alignment: Alignment.center,
          color: bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.create,
                color: iconColor,
                size: 21,
              ),
              const SizedBox(width: 15),
              Text(
                'Write Yours Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: txtColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  // final void Function() navigateTo;

  // const ButtonWithIcon({super.key, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: 37,
          width: 255,
          alignment: Alignment.center,
          color: Colors.green,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.create,
                color: Colors.white,
                size: 21,
              ),
              SizedBox(width: 21),
              Text(
                'Write Yours Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
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

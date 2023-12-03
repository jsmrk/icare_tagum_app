import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/user_concerns.dart';

import '../widgets/button_with_icon.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Stack(children: [
          CustomAppBar(),
          Positioned(
            top: 105,
            left: 17,
            child: Text(
              "Write Your Concerns\nWithout Worries",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 35,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Positioned(
            top: 225,
            left: 71,
            child: ButtonWithIcon(
              bgColor: Colors.white,
              iconColor: Color(0xff319F43),
              txtColor: Color(0xff319F43),
            ),
          ),
        ]),
        UserConcerns(),
      ],
    ));
  }
}

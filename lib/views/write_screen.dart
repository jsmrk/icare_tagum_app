import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/user_concerns.dart';
import 'package:icare_tagum_app/widgets/write_sheet.dart';

import '../widgets/button_with_icon.dart';

class WriteScreen extends StatelessWidget {
  static const routeName = '/write-screen';
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          const CustomAppBar(),
          const Positioned(
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
              iconColor: const Color(0xff319F43),
              txtColor: const Color(0xff319F43),
              onTapFunction: () => showModalBottomSheet(
                backgroundColor: Colors.white,
                enableDrag: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(19),
                  ),
                ),
                context: context,
                builder: (context) => const WriteConcernSheet(),
              ),
            ),
          ),
        ]),
        const UserConcerns(),
      ],
    ));
  }
}

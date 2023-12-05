import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/concerns_container.dart';
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
            CustomAppBar(appbarHeight: 275),
            const Positioned(
              top: 95,
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
              top: 205,
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
          Container(
            height: 465,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            margin: const EdgeInsets.only(top: 9, left: 9, right: 9),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 9, left: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Concerns',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        UserConcerns(),
                        const SizedBox(height: 5)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

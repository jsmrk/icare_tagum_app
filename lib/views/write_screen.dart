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
            const CustomAppBar(appbarHeight: 301),
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
          Container(
            height: 425,
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
              vertical: 15,
              horizontal: 15,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Concerns',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
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

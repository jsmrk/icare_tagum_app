// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';

import '../widgets/updates_container.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomAppBar(appbarHeight: 175),
              const Positioned(
                top: 99,
                left: 23,
                child: Text(
                  "Government Updates",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 33,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Container(
            height: 575,
            width: double.infinity,
            child: const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    UpdatesContainer(),
                    SizedBox(
                      height: 7,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

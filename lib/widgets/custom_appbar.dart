import 'package:flutter/material.dart';

import '../Services/nickname_services.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  final nickname = Nickname();
  final double appbarHeight;

  CustomAppBar({required this.appbarHeight, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appbarHeight,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.7],
                  colors: [
                    Color(0xff008348),
                    Color(0xff319F43),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 55,
                horizontal: 11,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 20.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              25), // Match the radius of CircleAvatar
                          child: Image.asset(
                            'lib/assets/images/dummy.png',
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      Text(
                        nickname.readNickname(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () => SystemNavigator.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

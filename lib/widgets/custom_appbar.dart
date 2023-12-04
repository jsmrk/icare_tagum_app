import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final double appbarHeight;
  const CustomAppBar({required this.appbarHeight, super.key});

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
                vertical: 35,
                horizontal: 11,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(''),
                        radius: 20.0,
                      ),
                      SizedBox(width: 15), // Add space between avatar and text
                      Text(
                        'Hi, Jess Mark',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: null,
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

import 'package:flutter/material.dart';

class GradientAppBarWithProfile extends StatelessWidget
    implements PreferredSizeWidget {
  const GradientAppBarWithProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                colors: [Color(0xff008348), Color(0xff319F43)],
              ),
            ),
          ),
          const SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 11),
                    CircleAvatar(
                      backgroundImage: NetworkImage(''),
                      radius: 20.0,
                    ),
                    SizedBox(width: 15), // Add space between avatar and text
                    Text(
                      'Jess Mark',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(259);
}

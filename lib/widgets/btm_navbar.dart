import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icare_tagum_app/screens/home_screen.dart';
import 'package:icare_tagum_app/screens/nickname_input.dart';
import 'package:icare_tagum_app/screens/write_screen.dart';

class BtmNavBar extends StatefulWidget {
  static const routeName = '/btmNavbar-screen';
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BtmNavBar> {
  int _selectedIndex = 0;

  final List _views = [
    const HomeScreen(),
    const WriteScreen(),
    const NicknameScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_selectedIndex],
      bottomNavigationBar: GNav(
        backgroundColor: const Color(0xff319F43),
        gap: 7,
        activeColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        iconSize: 31,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 13,
        ),
        duration: const Duration(milliseconds: 400),
        color: Colors.white,
        tabs: const [
          GButton(
            icon: Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: Icons.create_outlined,
            text: 'Write',
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: 'Settings',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

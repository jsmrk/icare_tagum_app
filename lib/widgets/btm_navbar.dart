import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icare_tagum_app/screens/home_screen.dart';
import 'package:icare_tagum_app/screens/nickname_input.dart';
import 'package:icare_tagum_app/screens/splash_screen.dart';

class BtmNavBar extends StatefulWidget {
  static const routeName = '/btmNavbar-screen';
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _NavBarState();
}

class _NavBarState extends State<BtmNavBar> {
  //Curved Bard
  // int _page = 0;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int _selectedIndex = 0;

  final List _views = [
    const HomeScreen(),
    const SplashScreen(),
    const NicknameScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_selectedIndex],
      bottomNavigationBar: GNav(
        backgroundColor: const Color(0xff319F43),
        hoverColor: Colors.grey[100]!,
        tabBorderRadius: 31,
        gap: 7,
        activeColor: Colors.white,
        iconSize: 24,
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 17),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: const Color(0xff319F43),
        color: Colors.white54,
        tabs: const [
          GButton(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 25),
            icon: Icons.home_outlined,
            iconSize: 35,
            text: 'Home',
          ),
          GButton(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
            icon: Icons.create_rounded,
            iconSize: 27,
            text: 'Write',
          ),
          GButton(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
            icon: Icons.settings_rounded,
            iconSize: 27,
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

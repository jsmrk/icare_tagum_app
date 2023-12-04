import 'package:flutter/material.dart';
import 'package:icare_tagum_app/views/home_screen.dart';
import 'package:icare_tagum_app/views/nickname_input.dart';
import 'package:icare_tagum_app/views/splash_screen.dart';
import 'package:icare_tagum_app/views/welcom_screen.dart';
import 'package:icare_tagum_app/views/write_screen.dart';
import 'package:icare_tagum_app/widgets/btm_navbar.dart';

//THIS COMMIT IS PURE STATIC APP

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF319F43),
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF319F43),
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(),
        ),
        fontFamily: 'Inter',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
              titleMedium:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              titleSmall: const TextStyle(
                fontSize: 13,
              ),
            ),
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        NicknameScreen.routeName: (context) => const NicknameScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        BtmNavBar.routeName: (context) => const BtmNavBar(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WriteScreen.routeName: (context) => const WriteScreen(),
      },
    );
  }
}

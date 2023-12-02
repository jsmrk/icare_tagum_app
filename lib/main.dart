import 'package:flutter/material.dart';
import 'package:icare_tagum_app/screens/home_screen.dart';
import 'package:icare_tagum_app/screens/nickname_input.dart';
import 'package:icare_tagum_app/screens/splash_screen.dart';
import 'package:icare_tagum_app/screens/welcom_screen.dart';

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
                fontWeight: FontWeight.w900,
                fontSize: 17,
              ),
              titleMedium:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              titleSmall: const TextStyle(
                fontSize: 13,
              ),
            ),
      ),
      home: const HomeScreen(),
    );
  }
}

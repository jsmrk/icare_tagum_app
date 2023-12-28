import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:icare_tagum_app/Services/auth_page.dart';
import 'package:icare_tagum_app/firebase_options.dart';

import 'package:icare_tagum_app/views/home_screen.dart';
import 'package:icare_tagum_app/views/nickname_input.dart';
import 'package:icare_tagum_app/views/splash_screen.dart';
import 'package:icare_tagum_app/views/welcom_screen.dart';
import 'package:icare_tagum_app/views/write_screen.dart';
import 'package:icare_tagum_app/widgets/btm_navbar.dart';

Future<void> main() async {
  //init Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initHive
  await Hive.initFlutter();
  //openHiveBox
  await Hive.openBox('nicknameBox');
  await Hive.openBox('concernIndexBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        '/': (context) => const AuthPage(),
        AuthPage.routeName: (context) => const AuthPage(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        NicknameScreen.routeName: (context) => NicknameScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        BtmNavBar.routeName: (context) => const BtmNavBar(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        WriteScreen.routeName: (context) => const WriteScreen(),
      },
    );
  }
}

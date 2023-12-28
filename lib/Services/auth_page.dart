import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:icare_tagum_app/views/nickname_input.dart';

import '../views/splash_screen.dart';
import '../views/welcom_screen.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth-screen';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nicknameBox = Hive.box('nicknameBox');

    final isNicknameAvailable = nicknameBox.isNotEmpty;

    return isNicknameAvailable ? WelcomeScreen() : NicknameScreen();
  }
}

import 'package:flutter/material.dart';
import 'package:icare_tagum_app/screens/home_screen.dart';
import 'package:icare_tagum_app/widgets/btm_navbar.dart';

import '../widgets/button_no_icon.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset('lib/assets/images/logo.png', scale: 11),
            const SizedBox(height: 55),
            //Text
            Text(
              'Welcome to iCare, Jess Mark',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Where ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const TextSpan(
                    text: 'Tagumenyos',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                      fontSize: 17,
                    ),
                  ),
                  TextSpan(
                    text: " Voice Matter !",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 65),
            //button
            ButtonWithoutIcon(
              navigateTo: () =>
                  Navigator.pushReplacementNamed(context, BtmNavBar.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

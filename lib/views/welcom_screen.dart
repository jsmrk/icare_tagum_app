import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/btm_navbar.dart';

import '../Services/nickname_services.dart';
import '../widgets/button_no_icon.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome-screen';
  final nickname = Nickname().readNickname();
  WelcomeScreen({super.key});

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
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcom to iCare, ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextSpan(
                    //this code is call the nickname
                    text: nickname,
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
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
                      fontSize: 21,
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
                onTap: () => Navigator.pushReplacementNamed(
                    context, BtmNavBar.routeName),
                bgColor: Colors.green,
                buttonText: 'Continue',
                curvedSize: 25,
                txtColor: Colors.white),
          ],
        ),
      ),
    );
  }
}

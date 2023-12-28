import 'package:flutter/material.dart';
import 'package:icare_tagum_app/Services/auth_page.dart';
import 'package:icare_tagum_app/Services/nickname_services.dart';
import 'package:icare_tagum_app/views/nickname_input.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushReplacementNamed(context, AuthPage.routeName);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/images/logo.png', scale: 12.5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: Text(
                  'Making Tagum a better place \n for everyone.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

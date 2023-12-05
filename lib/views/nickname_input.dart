import 'package:flutter/material.dart';
import 'package:icare_tagum_app/Services/user_concerns_services.dart';
import 'package:icare_tagum_app/views/welcom_screen.dart';
import 'package:icare_tagum_app/widgets/button_no_icon.dart';

class NicknameScreen extends StatelessWidget {
  static const routeName = '/nickname-screen';
  final nicknameController = TextEditingController();
  NicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(height: 125),
          //logo
          Image.asset('lib/assets/images/logo.png', scale: 12.5),
          const SizedBox(height: 5),
          //Text
          Text(
            'Once a Tagumenyo always a Tagumenyo',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 99),
          //question
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            alignment: Alignment.centerLeft,
            child: Text(
              'What should we call you?',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 19),
          //textbox
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            child: TextField(
              controller: nicknameController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15),
                prefixIcon: const Icon(
                  Icons.person_outline_outlined,
                  color: Colors.grey,
                  size: 27,
                ),
                hintText: 'Nickname',
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.9,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 99),
          //button
          ButtonWithoutIcon(
              onTap: () {
                Nickname().writeNickname(nicknameController.text);
                Navigator.pushReplacementNamed(
                    context, WelcomeScreen.routeName);
              },
              // Navigator.pushReplacementNamed(context, WelcomeScreen.routeName),
              bgColor: Colors.green,
              buttonText: 'Continue',
              curvedSize: 25,
              txtColor: Colors.white),
        ],
      ),
    );
  }
}

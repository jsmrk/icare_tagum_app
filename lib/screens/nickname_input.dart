import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/button_no_icon.dart';

class NicknameScreen extends StatelessWidget {
  const NicknameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Image.asset('lib/assets/images/logo.png', scale: 12.5),
          //Text
          Text(
            'Once a Tagumenyo always a Tagumenyo',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          //question
          Text(
            'What should we call you?',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.left,
          ),
          //textbox
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            child: TextField(
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
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 1.9,
                  ),
                ),
              ),
            ),
          ),
          //button
          const ButtonWithoutIcon()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
          ),
          //textbox
          const TextField(),
          //button
          ElevatedButton(
            style: Theme.of(context).buttonTheme,
            onPressed: () {},
            child: const Text('Continue'),
          )
        ],
      ),
    );
  }
}

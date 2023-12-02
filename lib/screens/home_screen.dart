import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: <Widget>[
          GradientAppBarWithProfile(),
          Text("data"),
        ],
      ),
    );
  }
}

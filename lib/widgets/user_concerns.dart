import 'package:flutter/material.dart';

class UserConcerns extends StatelessWidget {
  const UserConcerns({super.key});

  Widget builContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 19,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return builContainer(
      Column(
        children: [
          Text(
            'Your Concerns',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          builContainer(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Your Concerns',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text('description')
                  ],
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.asset(
                    'lib/assets/images/Tagum-Flyover.jpeg',
                    fit: BoxFit.cover,
                    height: 101,
                    width: 105,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

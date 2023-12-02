import 'package:flutter/material.dart';

class HomeLatestNews extends StatelessWidget {
  const HomeLatestNews({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Latest News',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View Updates',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Image.asset(
              'lib/assets/images/Tagum-Flyover.jpeg',
              fit: BoxFit.cover,
              height: 155,
              width: 325,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15,
              top: 15,
            ),
            child: Text(
              'The Flyover A.K.A Dubai Tagum',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: const Text(
                '      The long awaited flyover is now complete as the longest flyover in the mindanao. The Tagumeños is as excited as ever! The Dubai in the mindanao will finally be over.'),
          )
        ],
      ),
    );
  }
}

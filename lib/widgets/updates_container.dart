import 'package:flutter/material.dart';

class UpdatesContainer extends StatelessWidget {
  const UpdatesContainer({super.key});

  Widget builContainer(Widget child) {
    return Container(
      height: 155,
      width: 371,
      margin: const EdgeInsets.only(top: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    String concernDescription =
        '   The long awaited flyover is now complete declared as the longest flyover in the mindanao. The Tagumeños is as excited as ever! The Dubai in the mindanao will finally be over.';

    return builContainer(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            height: 135,
            width: 195,
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'The Flyover A.K.A Dubai Tagum is Done',
                  style: Theme.of(context).textTheme.titleLarge,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
                Text(
                  concernDescription,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    child: const Text(
                      'View Update',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.green, fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7, right: 7, bottom: 7),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.asset(
                'lib/assets/images/Tagum-Flyover.jpeg',
                fit: BoxFit.cover,
                height: 155,
                width: 153,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

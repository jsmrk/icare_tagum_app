import 'package:flutter/material.dart';

class UpdatesContainer extends StatelessWidget {
  final void Function() updateDetails;
  final String title;
  final String description;
  final String imageURL;
  const UpdatesContainer(
      {required this.title,
      required this.description,
      required this.imageURL,
      required this.updateDetails,
      super.key});

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
    return GestureDetector(
      onTap: updateDetails,
      child: builContainer(
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
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    description,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
                  ),
                  // Container(
                  //   alignment: Alignment.topLeft,
                  //   child: GestureDetector(
                  //     child: const Text(
                  //       'View Update',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(color: Colors.green, fontSize: 13),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7, right: 7, bottom: 7),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                  height: 155,
                  width: 153,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

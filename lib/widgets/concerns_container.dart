import 'package:flutter/material.dart';

class UserConcerns extends StatelessWidget {
  final void Function() concernDetails;
  final String title;
  final String description;
  final String imageURL;
  const UserConcerns(
      {required this.title,
      required this.description,
      required this.imageURL,
      required this.concernDetails,
      super.key});

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5.0,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 9,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: concernDetails,
      child: buildContainer(
        SizedBox(
          height: 105,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(11),
                width: 235,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        description,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(fontFamily: 'Inter', fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                  height: 105,
                  width: 115,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

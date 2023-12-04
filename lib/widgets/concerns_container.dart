import 'package:flutter/material.dart';

class UserConcerns extends StatelessWidget {
  UserConcerns({super.key});

  Widget builContainer(Widget child) {
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
    String concernDescription =
        'Naunsa naman ning tagum mura namag dubai, aksyoni intawn ni ninyo City Government kay abog jud kaayo muagi sa Highway.';

    return GestureDetector(
      onTap: null,
      child: builContainer(
        Container(
          height: 105,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: 205,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Tagum Murag Dubai',
                        style: Theme.of(context).textTheme.titleMedium,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      concernDescription,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: Image.asset(
                  'lib/assets/images/Tagum-Flyover.jpeg',
                  fit: BoxFit.cover,
                  height: 105,
                  width: 105,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

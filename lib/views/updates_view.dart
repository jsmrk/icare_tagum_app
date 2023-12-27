import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/updates_model.dart';
import '../widgets/button_no_icon.dart';

class UpdatesView extends StatefulWidget {
  final Updates updates;

  const UpdatesView(this.updates, {super.key});

  @override
  State<UpdatesView> createState() => _UpdatesViewState();
}

class _UpdatesViewState extends State<UpdatesView> {
  int _currentImageIndex = 0;
  String getFormattedDate(Updates updates) {
    final dateTime = updates.dateTime;
    final formatter = DateFormat('yyyy-MM-dd'); // Customize format as needed
    return formatter.format(dateTime);
  }

  String getFormattedTime(Updates updates) {
    final dateTime = updates.dateTime;
    final formatter = DateFormat('h:mm a'); // Customize format as needed
    return formatter.format(dateTime);
  }

  Widget displayImages() {
    return SizedBox(
      height: 225,
      width: 365,
      child: widget.updates.imageURLs!.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                // PageView for sliding images
                PageView.builder(
                  itemCount: widget.updates.imageURLs!.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int newPageIndex) {
                    setState(() {
                      _currentImageIndex = newPageIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Image.network(
                              widget.updates.imageURLs![index],
                              fit: BoxFit.cover,
                            )));
                  },
                ),

                // Dots for multiple images
                if (widget.updates.imageURLs!.length > 1)
                  Positioned(
                    bottom: 11,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.updates.imageURLs!.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 11,
                          height: 11,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentImageIndex
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget smallDetails(String title, String details) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 1.9, bottom: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            TextSpan(
              text: details,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 645,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 9),
            const Text(
              '▔▔▔▔',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w900,
              ),
            ),
            displayImages(),
            Container(
              padding: const EdgeInsets.only(
                top: 15,
                left: 17,
                right: 17,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(widget.updates.title,
                        style: const TextStyle(
                            fontSize: 21,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetails('Author :   ', widget.updates.author),
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    smallDetails('', getFormattedDate(widget.updates)),
                    const SizedBox(
                      width: 9,
                    ),
                    smallDetails('', getFormattedTime(widget.updates)),
                  ]),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(widget.updates.description,
                        style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 15),
                  ButtonWithoutIcon(
                    onTap: () => Navigator.pop(context),
                    bgColor: Colors.green,
                    buttonText: 'Close',
                    curvedSize: 15,
                    txtColor: Colors.white,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

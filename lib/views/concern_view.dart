import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user_concern_model.dart';
import '../widgets/button_no_icon.dart';

class ViewConcern extends StatefulWidget {
  final Concern concern;

  const ViewConcern(this.concern, {super.key});

  @override
  State<ViewConcern> createState() => _ViewConcernState();
}

class _ViewConcernState extends State<ViewConcern> {
  int _currentImageIndex = 0;
  String getFormattedDate(Concern concern) {
    final dateTime = concern.dateTime;
    final formatter = DateFormat('yyyy-MM-dd'); // Customize format as needed
    return formatter.format(dateTime);
  }

  String getFormattedTime(Concern concern) {
    final dateTime = concern.dateTime;
    final formatter = DateFormat('h:mm a'); // Customize format as needed
    return formatter.format(dateTime);
  }

  Widget displayImages() {
    return SizedBox(
      height: 225,
      width: 365,
      child: widget.concern.imageURLs!.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                // PageView for sliding images
                PageView.builder(
                  itemCount: widget.concern.imageURLs!.length,
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
                              widget.concern.imageURLs![index],
                              fit: BoxFit.cover,
                            )));
                  },
                ),

                // Dots for multiple images
                if (widget.concern.imageURLs!.length > 1)
                  Positioned(
                    bottom: 11,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.concern.imageURLs!.length,
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
    return Container(
      height: 623,
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
                    child: Text(widget.concern.title,
                        style: const TextStyle(
                            fontSize: 21,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 15),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetails('Status :   ', widget.concern.status),
                        smallDetails('', getFormattedDate(widget.concern)),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetails('Date :   ', widget.concern.department),
                        smallDetails('', getFormattedTime(widget.concern)),
                      ]),
                  smallDetails('Urgency :   ', widget.concern.urgency),
                  smallDetails('Location :   ', widget.concern.location),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(widget.concern.description,
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

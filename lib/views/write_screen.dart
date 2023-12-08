import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/concerns_container.dart';
import 'package:icare_tagum_app/views/write_sheet_screen.dart';
import 'package:intl/intl.dart';

import '../Services/nickname_services.dart';
import '../models/user_concern_model.dart';
import '../widgets/button_with_icon.dart';

class WriteScreen extends StatelessWidget {
  static const routeName = '/write-screen';
  const WriteScreen({super.key});

  String nickname() {
    return Nickname().readNickname();
  }

  Stream<List<Concern>> readConcerns() {
    return FirebaseFirestore.instance
        .collection('nickname')
        .doc(nickname())
        .collection('concern')
        .orderBy('datetime', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              final timestamp = data['datetime'];
              final dateTime = timestamp.toDate();

              List<String>? imageURLs;
              try {
                // Check for null or non-list value
                imageURLs = (data['imageURL'] as List).cast<String>();
              } catch (error) {
                print('Error retrieving image URLs: $error');
              }

              final concern = Concern(
                imageURLs: imageURLs,
                urgency: data['urgency'],
                title: data['title'],
                description: data['description'],
                location: data['location'],
                dateTime: dateTime,
              );
              return concern;
            }).toList());
  }

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

  Widget buildConcern(BuildContext context, Concern concern) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          UserConcerns(
              title: concern.title,
              description: concern.description,
              imageURL: concern.imageURLs![0],
              concernDetails: () {})
          // for (final imageUrl in concern.imageURLs!) Image.network(imageUrl),
          //   onPressed: () => showModalBottomSheet(
          //     context: context,
          //     builder: (context) => null,
          //     // builder: (context) => ConcernBottomSheet(concern),
          //   ),
          //   icon: const Icon(
          //     Icons.read_more,
          //     size: 55,
          //   ),
          // )
        ],
      ),
    );
  }
  //   Widget buildConcern(BuildContext context, Concern concern) {
  //   return Container(
  //     margin: const EdgeInsets.all(31),
  //     alignment: Alignment.center,
  //     child: Column(
  //       children: [
  //         for (final imageUrl in concern.imageURLs!) Image.network(imageUrl),
  //         Text(concern.urgency),
  //         Text(concern.title),
  //         Text(concern.description),
  //         Text(concern.location),
  //         Text(getFormattedDate(concern)),
  //         Text(getFormattedTime(concern)),
  //         // IconButton(
  //         //   onPressed: () => showModalBottomSheet(
  //         //     context: context,
  //         //     builder: (context) => null,
  //         //     // builder: (context) => ConcernBottomSheet(concern),
  //         //   ),
  //         //   icon: const Icon(
  //         //     Icons.read_more,
  //         //     size: 55,
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            CustomAppBar(appbarHeight: 275),
            const Positioned(
              top: 95,
              left: 17,
              child: Text(
                "Write Your Concerns\nWithout Worries",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              top: 205,
              left: 71,
              child: ButtonWithIcon(
                bgColor: Colors.white,
                iconColor: const Color(0xff319F43),
                txtColor: const Color(0xff319F43),
                onTapFunction: () => showModalBottomSheet(
                  backgroundColor: Colors.white,
                  enableDrag: true,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(19),
                    ),
                  ),
                  context: context,
                  builder: (context) => const WriteConcernSheet(),
                ),
              ),
            ),
          ]),
          Container(
            height: 465,
            margin: const EdgeInsets.only(top: 9, left: 9, right: 9),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 9, left: 15),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Concerns',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(height: 15),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 415,
                    child: StreamBuilder<List<Concern>>(
                      stream: readConcerns(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          // print('Error Here:');
                          // print(snapshot.error);
                          // print('Error Here:');
                          return const Text('An error occured!');
                        } else if (snapshot.hasData) {
                          final concerns =
                              snapshot.data!; // Use plural 'concerns'
                          if (concerns.isEmpty) {
                            return const Center(
                                child: Text('No concerns found'));
                          } else {
                            return ListView(
                              children: concerns
                                  .map((concern) =>
                                      buildConcern(context, concern))
                                  .toList(),
                            );
                          }
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
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

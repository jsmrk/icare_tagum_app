import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/concerns_container.dart';
import 'package:icare_tagum_app/views/write_sheet_screen.dart';
import 'package:intl/intl.dart';

import '../Services/nickname_services.dart';
import '../models/user_concern_model.dart';
import '../widgets/button_with_icon.dart';
import 'concern_view.dart';

class WriteScreen extends StatelessWidget {
  static const routeName = '/write-screen';
  const WriteScreen({super.key});

  String nickname() {
    return Nickname().readNickname();
  }

  Stream<List<Concern>> readConcerns() {
    return FirebaseFirestore.instance
        .collection('concerns') // Access the top-level 'concerns' collection
        .where('nickname',
            isEqualTo:
                nickname()) // Apply the filter// Maintain descending order
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
                status: data['status'],
                department: data['department'],
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
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
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
                  padding: const EdgeInsets.only(top: 15, left: 15, bottom: 3),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Your Concerns',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(
                  thickness: .5,
                ),
                StreamBuilder<List<Concern>>(
                  stream: readConcerns(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('An error occured!');
                    } else if (snapshot.hasData) {
                      final concerns = snapshot.data!;
                      if (concerns.isEmpty) {
                        return const Center(child: Text('No concerns found'));
                      } else {
                        return Flexible(
                          child: ListView(
                            padding: const EdgeInsets.only(top: 3),
                            children: concerns
                                .map(
                                  (concern) => UserConcerns(
                                    title: concern.title,
                                    description: concern.description,
                                    imageURL: concern.imageURLs![0],
                                    concernDetails: () => showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(19),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) =>
                                            ViewConcern(concern)),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      }
                    } else {
                      return const CircularProgressIndicator(
                        color: Colors.green,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

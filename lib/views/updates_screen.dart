// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_app/models/updates_model.dart';
import 'package:icare_tagum_app/views/updates_view.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';

import '../widgets/updates_container.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  Stream<List<Updates>> readUpdates() {
    return FirebaseFirestore.instance
        .collection('updates')
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

              final concern = Updates(
                author: data['author'],
                imageURLs: imageURLs,
                title: data['title'],
                description: data['description'],
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
          Stack(
            children: [
              CustomAppBar(appbarHeight: 175),
              const Positioned(
                top: 109,
                left: 23,
                child: Text(
                  "Government Updates",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 33,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 575,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: Column(
                  children: [
                    StreamBuilder<List<Updates>>(
                      stream: readUpdates(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('An error occured!');
                        } else if (snapshot.hasData) {
                          final updates = snapshot.data!;
                          if (updates.isEmpty) {
                            return const Center(
                                child: Text('No concerns found'));
                          } else {
                            return Flexible(
                              child: ListView(
                                padding: const EdgeInsets.only(top: 3),
                                children: updates
                                    .map(
                                      (updates) => UpdatesContainer(
                                        title: updates.title,
                                        description: updates.description,
                                        imageURL: updates.imageURLs![0],
                                        updateDetails: () =>
                                            showModalBottomSheet(
                                                backgroundColor: Colors.white,
                                                enableDrag: true,
                                                isScrollControlled: true,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(19),
                                                  ),
                                                ),
                                                context: context,
                                                builder: (context) =>
                                                    UpdatesView(updates)),
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
                    const SizedBox(
                      height: 7,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

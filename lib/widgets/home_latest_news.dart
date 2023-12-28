import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/updates_model.dart';

class HomeLatestNews extends StatefulWidget {
  const HomeLatestNews({super.key});

  @override
  State<HomeLatestNews> createState() => _HomeLatestNewsState();
}

class _HomeLatestNewsState extends State<HomeLatestNews> {
  int _currentImageIndex = 0;

  Stream<Updates> readLatestUpdate() {
    return FirebaseFirestore.instance
        .collection('updates')
        .orderBy('datetime',
            descending: true) // Order by timestamp, latest first
        .limit(1) // Fetch only the first document
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.first) // Get the first (latest) document
        .map((doc) {
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

      return Updates(
        author: data['author'],
        imageURLs: imageURLs,
        title: data['title'],
        description: data['description'],
        dateTime: dateTime,
      );
    });
  }

  Widget displayImages(List<String>? imageURLs) {
    // Accept imageURLs as a parameter
    return SizedBox(
      height: 161,
      width: 365,
      child: imageURLs == null || imageURLs.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                // PageView for sliding images
                PageView.builder(
                  itemCount: imageURLs.length,
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
                          imageURLs[
                              index], // Use imageURLs from function parameter
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                // Dots for multiple images
                if (imageURLs.length > 1)
                  Positioned(
                    bottom: 11,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        imageURLs.length,
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
        horizontal: 19,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 19),
                child: Text(
                  'Latest News',
                  style: Theme.of(context).textTheme.titleLarge,
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
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: StreamBuilder<Updates>(
              stream: readLatestUpdate(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final latestUpdate = snapshot.data!;
                  return Column(
                    children: [
                      Container(
                        child: displayImages(latestUpdate.imageURLs),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: Text(
                          latestUpdate.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 3, bottom: 15),
                          child: Text(
                            latestUpdate.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading latest update: ${snapshot.error}');
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

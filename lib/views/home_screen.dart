import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_app/views/write_screen.dart';
import 'package:icare_tagum_app/widgets/button_with_icon.dart';
import 'package:icare_tagum_app/widgets/custom_appbar.dart';
import 'package:icare_tagum_app/widgets/home_latest_news.dart';

import '../models/updates_model.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<int>> getConcernCounts() async {
      final snapshot =
          await FirebaseFirestore.instance.collection('concerns').get();

      final totalCount = snapshot.docs.length;
      final viewedCount =
          snapshot.docs.where((doc) => doc.get('status') == 'Viewed').length;

      return [totalCount, viewedCount];
    }

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomAppBar(appbarHeight: 301),
              const Positioned(
                top: 85,
                left: 61,
                child: Text(
                  "iCare Tagum",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 45,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const Positioned(
                top: 155,
                left: 121,
                child: Text(
                  "TAGUM - TAGUMPAY",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(
                  top: 201,
                  bottom: 21,
                  left: 17,
                  right: 17,
                ),
                height: 179,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder<List<int>>(
                      future: getConcernCounts(), // Fetch the counts
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final totalCount = snapshot.data![0];
                          final viewedCount = snapshot.data![1];

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    totalCount.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 55,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Reports\nReceived',
                                    style: TextStyle(fontFamily: 'Inter'),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    viewedCount.toString(),
                                    style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 51,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text('Reports\nViewed'),
                                ],
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error loading counts: ${snapshot.error}');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    ButtonWithIcon(
                      bgColor: const Color(0xff319F43),
                      iconColor: Colors.white,
                      txtColor: Colors.white,
                      onTapFunction: () =>
                          Navigator.pushNamed(context, WriteScreen.routeName),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const HomeLatestNews(),
        ],
      ),
    );
  }
}

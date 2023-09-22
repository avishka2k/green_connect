// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_bar_with_back.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:intl/intl.dart';

class ComView extends StatefulWidget {
  String? eventId;
  ComView({
    super.key,
    this.eventId,
  });

  @override
  State<ComView> createState() => _ComViewState();
}

class _ComViewState extends State<ComView> {
  bool isReactClicked = false;

  final firestoreInstance = FirebaseFirestore.instance;

  bool isLoading = true;
  String title = '';
  String about = '';
  String date = '';
  String location = '';
  String eventDate = '';
  String imageUrl = '';
  String formattedDate = '';
  String startTime = '';
  String endTime = '';

  @override
  void initState() {
    fetchModulesData();
    super.initState();
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection = await firestoreInstance
          .collection("comevents")
          .doc(widget.eventId)
          .get();

      setState(() {
        title = remindCollection.get("title");
        about = remindCollection.get("about");
        location = remindCollection.get("location");
        imageUrl = remindCollection.get("imageUrl");
        DateTime timeStart = remindCollection.get("timeStart").toDate();
        DateTime timeEnd = remindCollection.get("timeEnd").toDate();
        eventDate = DateFormat('E, MMM d, y').format(timeStart);
        startTime = DateFormat('h:mm a').format(timeStart);
        endTime = DateFormat('h:mm a').format(timeEnd);
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBack(title: "Events"),
      body: isLoading
          ? const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.black,
                                    child: Opacity(
                                      opacity: 0.8,
                                      child: Image.network(
                                        imageUrl,
                                        height: 330,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Positioned(
                              right: 30,
                              bottom: 20,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.ios_share,
                                    fill: 1,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 30),
                                  Icon(
                                    Icons.favorite,
                                    fill: 1,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ), //SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: appPagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: appBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: appBlack,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(eventDate),
                                    Text(
                                      location,
                                      style: const TextStyle(
                                        color: appBlack,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '$startTime - $endTime',
                                  style: const TextStyle(
                                    color: appBlack,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About',
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              about,
                              style: const TextStyle(
                                color: appBlack,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/calendar_events_card.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/models/myclass.dart';
import 'package:intl/intl.dart';

class CalendarClassTab extends StatefulWidget {
  const CalendarClassTab({super.key});

  @override
  State<CalendarClassTab> createState() => _CalendarClassTabState();
}

class _CalendarClassTabState extends State<CalendarClassTab> {

  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  List<MyClass> myclass = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModulesData();
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection =
          await firestoreInstance.collection('todayLec').get();

      myclass = await Future.wait(remindCollection.docs.map((doc) async {
        DocumentReference moduleRef = doc.get('module');
        DocumentReference lecturerRef = doc.get('lecturer');
        DocumentSnapshot moduleSnapshot = await moduleRef.get();
        DocumentSnapshot lecturerSnapshot = await lecturerRef.get();

        String moduleName = moduleSnapshot.get('name');
        String lecturerName = lecturerSnapshot.get('name');
        String lecturerImage = lecturerSnapshot.get('imageUrl');

        return MyClass(
          classID: doc.id,
          module: moduleName,
          location: doc.get("location"),
          lecturerImage: lecturerImage,
          lecturerName: lecturerName,
          startTime: doc.get('startTime'),
          endTime: doc.get('endTime'),
        );
      }).toList());

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      AppToastmsg.appToastMeassage('Error fetching modules data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.only(top: 100),
              child: Center(child: CircularProgressIndicator()),
            )
          : myclass.isEmpty
              ? const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text("No class available"),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: myclass.length,
                  itemBuilder: (context, index) {
                    // String eventdate = DateFormat('E, MMM d, y')
                    //     .format(myclass[index]['date']);
                    if (myclass.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("No Class available"),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => EventDetialsPage(
                          //       eventId: widget.events[index].eventID,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  //spreadRadius: 1,
                                  blurRadius: 1,
                                  blurStyle: BlurStyle.solid,
                                  offset: Offset.zero,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5),
                                  Text(
                                    myclass[index].module,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xff00744A),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${myclass[index].startTime} - ${myclass[index].endTime} (UTC)',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Color(0xff00744A),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundImage: NetworkImage(
                                            myclass[index].lecturerImage,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        myclass[index].lecturerName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF00744A),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Color(0xFF00744A),
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          myclass[index].location,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF00744A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
    );
  }
}


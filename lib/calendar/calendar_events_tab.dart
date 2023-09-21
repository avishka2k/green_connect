import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/calendar_events_card.dart';
import 'package:green_connect/components/calendar_remind_card.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/models/events.dart';
import 'package:intl/intl.dart';

class Module {
  final String remindID;
  final String title;
  final String note;
  final String date;
  final String time;
  final String remind;
  Module({
    required this.remindID,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    required this.remind,
  });
}

class CalendarEventsTab extends StatefulWidget {
  DateTime selectDate;
  CalendarEventsTab({super.key, required this.selectDate});

  @override
  State<CalendarEventsTab> createState() => _CalendarEventsTabState();
}

class _CalendarEventsTabState extends State<CalendarEventsTab> {
  final firestoreInstance = FirebaseFirestore.instance;

  final User? user = FirebaseAuth.instance.currentUser;

  List<Events> event = [];

  bool isLoading = true;

  @override
  void initState() {
    fetchModulesData();
    super.initState();
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection =
          await firestoreInstance.collection('events').get();

      String currentDate = DateFormat('y-MM-dd').format(widget.selectDate);
      print('-----hhhhh-------');
      print(currentDate);
      event = remindCollection.docs
          .map((doc) {
            return Events(
              eventID: doc.id,
              title: doc.get("title"),
              timeStart: doc.get("timeStart").toDate(),
              imageUrl: doc.get("imageUrl"),
              location: doc.get("location"),
            );
          })
          .where((event) =>
              DateFormat('y-MM-dd').format(event.timeStart) == currentDate)
          .toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : event.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("No Remind available"),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: event.isEmpty ? 1 : event.length,
                        itemBuilder: (context, index) {
                          String eventdate = DateFormat('E, MMM d, y')
                              .format(event[index].timeStart);
                          if (event.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text("No Remind available"),
                              ),
                            );
                          } else {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EventDetialsPage(
                                      eventId: event[index].eventID,
                                    ),
                                  ),
                                );
                              },
                              child: CalendarEventCard(
                                title: event[index].title,
                                location: event[index].location,
                                eventdate: eventdate,
                              ),
                            );
                          }
                        },
                      ),
          ],
        ),
      ),
    );
  }
}

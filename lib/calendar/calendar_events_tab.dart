import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/calendar_events_card.dart';
import 'package:green_connect/components/calendar_remind_card.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/models/events.dart';
import 'package:intl/intl.dart';

class CalendarEventsTab extends StatefulWidget {
  final List<Events> events;
  bool isLoading;
  CalendarEventsTab({super.key, required this.events, required this.isLoading});

  @override
  State<CalendarEventsTab> createState() => _CalendarEventsTabState();
}

class _CalendarEventsTabState extends State<CalendarEventsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            widget.isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : widget.events.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("No Remind available"),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            widget.events.isEmpty ? 1 : widget.events.length,
                        itemBuilder: (context, index) {
                          String eventdate = DateFormat('E, MMM d, y')
                              .format(widget.events[index].timeStart);
                          if (widget.events.isEmpty) {
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
                                      eventId: widget.events[index].eventID,
                                    ),
                                  ),
                                );
                              },
                              child: CalendarEventCard(
                                title: widget.events[index].title,
                                location: widget.events[index].location,
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

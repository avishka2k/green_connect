import 'package:flutter/material.dart';
import 'package:green_connect/components/calendar_events_card.dart';

class CalendarEventsTab extends StatelessWidget {
  const CalendarEventsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            CalendarEventCard(),
          ],
        ),
      ),
    );
  }
}

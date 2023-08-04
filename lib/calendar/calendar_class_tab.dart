import 'package:flutter/material.dart';

import '../components/calendar_remind_card.dart';

class CalendarClassTab extends StatelessWidget {
  const CalendarClassTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
          CalendarRemindCard(),
        ],
      ),
    );
  }
}
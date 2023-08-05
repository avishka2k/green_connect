import 'package:flutter/material.dart';
import 'package:green_connect/calendar/calendar_remind_add.dart';

import '../components/calendar_remind_card.dart';

class CalendarRemindTab extends StatelessWidget {
  const CalendarRemindTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CalendarRemindAdd(),
                        ),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "ADD REMIND",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
            const CalendarRemindCard(),
          ],
        ),
      ),
    );
  }
}

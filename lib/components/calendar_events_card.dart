import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:hexcolor/hexcolor.dart';

class CalendarEventCard extends StatelessWidget {
  final String? title;
  final String? location;
  final String? date;
  final String? time;
  final String? eventdate;
  const CalendarEventCard({
    super.key,
    this.title,
    this.location,
    this.date,
    this.time,
    this.eventdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: HexColor("#00744A"),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                eventdate.toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(255, 43, 42, 42),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_pin,
                      size: 18, color: Colors.blueGrey),
                  Text(
                    location.toString(),
                    style: const TextStyle(fontSize: 12, color: appBlack),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

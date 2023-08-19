import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CalendarEventCard extends StatelessWidget {
  final String? title;
  final String? note;
  final String? date;
  final String? time;
  final String? remind;
  const CalendarEventCard({
    super.key,
    this.title,
    this.note,
    this.date,
    this.time,
    this.remind,
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
            // gradient: LinearGradient(
            //   colors: [
            //     const Color(0x7a69D199).withOpacity(0.5),
            //     const Color(0xff69D199).withOpacity(0.4),
            //   ],
            //   stops: const [0, 1],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
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
                note.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  //color: HexColor("#00744A"),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: HexColor("#ff4747"),
                    size: 18,
                  ),
                  Text(
                    "library",
                    style: TextStyle(
                      fontSize: 13,
                      color: HexColor("#00744A"),
                      fontWeight: FontWeight.w600,
                    ),
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

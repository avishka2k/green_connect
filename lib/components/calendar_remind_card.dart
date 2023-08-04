import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CalendarRemindCard extends StatelessWidget {
  const CalendarRemindCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(
          colors: [
            const Color(0x7a69D199).withOpacity(0.5),
            const Color(0xff69D199).withOpacity(0.4),
          ],
          stops: const [0, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Go to library and study",
            style: TextStyle(
                fontSize: 16,
                color: HexColor("#00744A"),
                fontWeight: FontWeight.w600),
          ),
          Text(
            "12:00 AM - 1.00 PM (UTC)",
            style: TextStyle(
                fontSize: 12,
                color: HexColor("#00744A"),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: HexColor("#00744A"),
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
    );
  }
}

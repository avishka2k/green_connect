import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalendarRemindCard extends StatefulWidget {
  final String itemId;
  final String? title;
  final String? note;
  final String? date;
  final String? time;
  final String? remind;
  const CalendarRemindCard({
    super.key,
    required this.itemId,
    this.title,
    this.note,
    this.date,
    this.time,
    this.remind,
  });

  @override
  State<CalendarRemindCard> createState() => _CalendarRemindCardState();
}

class _CalendarRemindCardState extends State<CalendarRemindCard> {
  final firestoreInstance = FirebaseFirestore.instance;

  final User? user = FirebaseAuth.instance.currentUser;

  void deleteModule(String remindID) async {
    try {
      await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("remind")
          .doc(remindID)
          .delete();

      // Update the widget state to reflect the changes
      setState(() {});
    } catch (e) {
      AppToastmsg.appToastMeassage('Error deleting module: $e');
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context, String itemId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Adjust the radius here
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteModule(itemId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            _showDeleteConfirmationDialog(context, widget.itemId);
          },
          child: Container(
            width: double.infinity,
            height: 80,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor("#00744A"),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.note.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        //color: HexColor("#00744A"),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.date.toString(),
                      style: const TextStyle(
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.time.toString(),
                      style: const TextStyle(
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

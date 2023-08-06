import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/profile/profile_academic_data.dart';
import '../app_color.dart';

// ignore: camel_case_types
class profile_academic_tab extends StatelessWidget {
  const profile_academic_tab({super.key});

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserEvents(
      User user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> academicSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('academic')
              .doc('lK3rXcfOCHJoSSxxX5pY')
              .get();

      return academicSnapshot;
    } catch (e) {
      // Handle any Firestore retrieval exceptions
      AppToastmsg.appToastMeassage('Error adding module data: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: appPagePadding,
      child: Column(
        children: [
          Table(
            columnWidths: const {
              0: FixedColumnWidth(100.0),
            },
            children: const [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "Current GPA",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "3.34",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "Class",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "2nd Upper",
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ]),
            ],
          ),
          const ProfileAcademicData(
            academicID: "year1sem1",
          )
        ],
      ),
    );
  }
}

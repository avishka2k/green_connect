import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_color.dart';
import '../components/flutter_toast.dart';

// ignore: camel_case_types
class ProfileStudentTab extends StatefulWidget {
  const ProfileStudentTab({super.key});

  @override
  State<ProfileStudentTab> createState() => _ProfileStudentTabState();
}

class _ProfileStudentTabState extends State<ProfileStudentTab> {
  //final DatabaseReference db = FirebaseDatabase.instance.ref();

  Future<Map<String, dynamic>?> fetchUserData(User user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        return userData.data();
      } else {
        AppToastmsg.appToastMeassage('User data not found in Firestore');
        return null;
      }
    } catch (e) {
      AppToastmsg.appToastMeassage('Failed to fetch user data: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: appPagePadding,
      child: FutureBuilder<Map<String, dynamic>?>(
          future: fetchUserData(user!),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final userData = snapshot.data;
              String email = userData!['email'] ?? 'Null';
              String username = userData['username'] ?? 'Null';
              String uid = userData['uid'] ?? 'Null';
              String faculty = userData['faculty'] ?? 'Null';
              String degree = userData['degree'] ?? 'Null';
              String intake = userData['intake'] ?? 'Null';
              return Table(
                columnWidths: const {
                  0: FixedColumnWidth(
                      100.0), // Set the width of the first column
                },
                children: [
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "UMIS ID",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        uid,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        username,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        email,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "Faculty",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        faculty,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "Degree",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        degree,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        "Intake",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        intake,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ]),
                ],
              );
            }
          }),
    );
  }
}

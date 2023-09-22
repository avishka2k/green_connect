import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/profile/profile_attendance_tab.dart.dart';
import 'profile_student_tab.dart';
import 'profile_academic_tab2.dart';
//import 'profile_attendance_tab.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  String currentUserName = 'loading...';

  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    fetchUserData(user!);
  }

  Future<void> fetchUserData(User user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          currentUserName = userData['name'];
          imageUrl = userData['imageUrl'];
        });
      } else {
        AppToastmsg.appToastMeassage('User data not found in Firestore');
      }
    } catch (e) {
      AppToastmsg.appToastMeassage('Failed to fetch user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: imageUrl.isEmpty
                  ? Container()
                  : ClipOval(
                      child: Image.network(
                        imageUrl,
                      ),
                    ),
                ),
                const SizedBox(height: 10),
                Text(currentUserName.fcapitalize(), style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
              ],
            ),
            const TabBar(
              indicatorWeight: 1,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.school,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text("Student"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_library,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text("Academic"),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fact_check,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text("Attendance"),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ProfileStudentTab(),
                  ProfileAcademicTab(),
                  ProfileAttendanceTab(academicID: "year4sem2")
                  //profile_attendance_tab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


extension StringExtensions on String {
  String fcapitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

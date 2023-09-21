import 'package:flutter/material.dart';
import 'package:green_connect/profile/profile_attendance_tab.dart.dart';
import 'profile_student_tab.dart';
import 'profile_academic_tab2.dart';
//import 'profile_attendance_tab.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

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
                  child: ClipOval(
                    child: Image.network("https://picsum.photos/200/200"),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("DEG Sahan", style: TextStyle(fontSize: 20)),
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

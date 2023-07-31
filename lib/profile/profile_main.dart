import 'package:flutter/material.dart';
import '../components/app_bar_with_menu.dart';
import 'profile_student_tab.dart';
import 'profile_academic_tab.dart';
//import 'profile_attendance_tab.dart';

class ProfileMain extends StatelessWidget {
  const ProfileMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithMenu(
          title: "Profile",
          notifications: 4,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 404,
                height: 148,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Image.network("https://picsum.photos/200/200"),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "DEG Sahan",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0, 0),
                        child: TabBar(
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 23),
                          indicatorWeight: 1,
                          indicatorColor: Theme.of(context).primaryColor,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.school,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text("Student",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.local_library,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text("Academic",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.fact_check,
                                    size: 16,
                                  ),
                                  SizedBox(width: 5),
                                  Text("Attendance",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            // Tab(
                            //   text: 'Example 3',
                            // ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            ProfileStudentTab(),
                            profile_academic_tab(),
                            profile_academic_tab(),
                            //profile_attendance_tab(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

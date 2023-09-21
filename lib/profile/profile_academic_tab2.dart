import 'package:flutter/material.dart';
import 'package:green_connect/profile/profile_academic_data.dart';
import '../app_color.dart';

// ignore: camel_case_types
class ProfileAcademicTab extends StatelessWidget {
  const ProfileAcademicTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: appPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "GPA",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "3.34",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 40,
                        color: Colors.white38,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Class",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "2nd Upper",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 0.5,
                        height: 40,
                        color: Colors.white38,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Rank",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Year 3 Semester 1",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const ProfileAcademicData(yearsem: "year3sem1"),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Year 2 Semester 2",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const ProfileAcademicData(yearsem: "year2sem2"),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Year 2 Semester 1",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const ProfileAcademicData(yearsem: "year2sem1"),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Year 1 Semester 2",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const ProfileAcademicData(yearsem: "year1sem2"),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Year 1 Semester 1",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            const ProfileAcademicData(yearsem: "year1sem1"),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

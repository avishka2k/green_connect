import 'package:flutter/material.dart';
import 'profile_academic_tab_tablerow.dart';

// ignore: camel_case_types
class profile_academic_tab extends StatelessWidget {
  const profile_academic_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Table(
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
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "3.34",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "Class",
                    style:
                        TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    "2nd Upper",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ]),
            ],
          ),
        ),
        const ProfileAcademicTabTableRow(
            semester: 'Year 3 Semester 1',
            rowData: [
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'A',
              },
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'B',
              },
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'B',
              },
            ]),
        const SizedBox(
          height: 10,
        ),
        const ProfileAcademicTabTableRow(
            semester: 'Year 3 Semester 1',
            rowData: [
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'A',
              },
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'B',
              },
              {
                'module_code': 'CS301.3',
                'module_title': 'IT Project Management',
                'module_result': 'B',
              },
            ])
      ],
    );
  }
}

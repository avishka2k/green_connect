import 'package:flutter/material.dart';

// ignore: camel_case_types
class profile_student_tab extends StatelessWidget {
  const profile_student_tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(100.0), // Set the width of the first column
        },
        children: const [
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "UMIS ID",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "253212",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "degsahan@students.lk",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Faculty",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Faculty Of Computing",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Degree",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "BSc (Hons) in Software Engineering",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Offered By",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "NSBM",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "Intake",
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "21.1",
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
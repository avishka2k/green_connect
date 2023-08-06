
// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_connect/components/flutter_toast.dart';


class Academic {
  final String academicID;
  Academic({required this.academicID});
}

class YearSemester {
  final String yearSemesterID;
  YearSemester({required this.yearSemesterID});
}

class Module {
  final String moduleID;
  final String field1;
  final String field2;
  Module({required this.moduleID, required this.field1, required this.field2});
}

class AddAcademic extends StatefulWidget {
  const AddAcademic({super.key});

  @override
  _AddAcademicState createState() => _AddAcademicState();
}

class _AddAcademicState extends State<AddAcademic> {
  final firestoreInstance = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(academicID: "academic_id");
  final YearSemester yearSemester = YearSemester(yearSemesterID: "year4sem2");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            addModuleData();
          },
          child: const Text("Add Module Data"),
        ),
      ),
    );
  }

  void addModuleData() async {
    try {
      final module1 = Module(
        moduleID: "module_id_1",
        field1: "value1_1",
        field2: "value2_1",
      );

      final module2 = Module(
        moduleID: "module_id_2",
        field1: "value1_2",
        field2: "value2_2",
      );

      // Add the modules to Firestore
      await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic")
          .doc(academic.academicID)
          .collection(yearSemester.yearSemesterID)
          .doc(
              "year1sem1_id") // Replace this with the actual document ID if needed
          .collection("module")
          .add(module1.toJson());

      await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic")
          .doc(academic.academicID)
          .collection(yearSemester.yearSemesterID)
          .doc(
              "year1sem1_id") // Replace this with the actual document ID if needed
          .collection("module")
          .add(module2.toJson());

      AppToastmsg.appToastMeassage('Module data added successfully.');
    } catch (e) {
      AppToastmsg.appToastMeassage('Error adding module data: $e');
    }
  }
}

extension ModuleExtension on Module {
  Map<String, dynamic> toJson() {
    return {
      "field1": field1,
      "field2": field2,
    };
  }
}

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
  final String code;
  final String title;
  final String score;
  Module(
      {required this.moduleID,
      required this.code,
      required this.title,
      required this.score});
}

class AddAcademic extends StatefulWidget {
  final String academicID;

  const AddAcademic({super.key, required this.academicID});

  @override
  _AddAcademicState createState() => _AddAcademicState();
}

class _AddAcademicState extends State<AddAcademic> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(academicID: "academic_id");

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
        code: "value1_1",
        title: "value2_1",
        score: "value2_1",
      );

      // Add the modules to Firestore
      await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic")
          .doc(academic.academicID)
          .collection(widget.academicID)
          .doc('${widget.academicID}_id')
          .collection("module")
          .add(module1.toJson());

      AppToastmsg.appToastMeassage('Module data added successfully.');
    } catch (e) {
      AppToastmsg.appToastMeassage('Error adding module data: $e');
    }
  }
}

extension ModuleExtension on Module {
  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "title": title,
      "score": score,
    };
  }
}

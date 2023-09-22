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

class FirestoreExample extends StatefulWidget {
  const FirestoreExample({super.key});

  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(academicID: "academic_id");
  final YearSemester yearSemester = YearSemester(yearSemesterID: "year1sem1");

  List<Module> modules = [];

  @override
  void initState() {
    super.initState();
    // Fetch and populate the modules list when the widget is created
    fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: modules.isNotEmpty
          ? ListView.builder(
              itemCount: modules.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Module ID: ${modules[index].moduleID}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Field 1: ${modules[index].field1}"),
                      Text("Field 2: ${modules[index].field2}"),
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text("No modules data found."),
            ),
    );
  }

  void fetchModulesData() async {
    try {
      final userAcademicCollection = firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic");

      final academicSnapshot = await userAcademicCollection.get();

      // Iterate through each academic document and fetch modules data
      for (var academicDoc in academicSnapshot.docs) {
        final yearSemesterSnapshot = await academicDoc.reference
            .collection("year_semester")
            .doc(yearSemester.yearSemesterID)
            .collection("module")
            .get();

        // Convert the query snapshot to a list of Module objects for the current academic ID
        List<Module> academicModules = yearSemesterSnapshot.docs.map((doc) {
          return Module(
            moduleID: doc.id,
            field1: doc.get("field1"),
            field2: doc.get("field2"),
          );
        }).toList();

        // Add the modules data for the current academic ID to the overall modules list
        modules.addAll(academicModules);
      }

      // Update the widget state to reflect the changes
      setState(() {});
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data: $e');
    }
  }
}

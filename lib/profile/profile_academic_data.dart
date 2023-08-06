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

class ProfileAcademicData extends StatefulWidget {
  final String academicID;
  const ProfileAcademicData({super.key, required this.academicID});

  @override
  _ProfileAcademicDataState createState() => _ProfileAcademicDataState();
}

class _ProfileAcademicDataState extends State<ProfileAcademicData> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(academicID: "academic_id");
  late YearSemester yearSemester =
      YearSemester(yearSemesterID: widget.academicID);

  List<Module> modules = [];
  List<Academic> academics = [];

  @override
  void initState() {
    super.initState();
    fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return modules.isNotEmpty
        ? ListView.builder(
            itemCount: modules.length,
            itemBuilder: (context, index) {
              // return ListTile(
              //   title: Text("Module ID: ${modules[index].moduleID}"),
              //   subtitle: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Field 1: ${modules[index].field1}"),
              //       Text("Field 2: ${modules[index].field2}"),
              //     ],
              //   ),
              // );

              return Table(
                columnWidths: const {
                  0: FixedColumnWidth(60.0),
                  2: FixedColumnWidth(30.0),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(modules[index].moduleID,
                            style: const TextStyle(fontSize: 12.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(modules[index].field1,
                            style: const TextStyle(fontSize: 12.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(modules[index].field1,
                            style: const TextStyle(fontSize: 12.0)),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        : const Center(
            child: Text("No data found."),
          );
  }

  void fetchModulesData() async {
    try {
      final snapshot = await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic")
          .doc(academic.academicID)
          .collection(yearSemester.yearSemesterID)
          .doc("year1sem1_id")
          .collection("module")
          .get();

      modules = snapshot.docs.map((doc) {
        return Module(
          moduleID: doc.id,
          field1: doc.get("field1"),
          field2: doc.get("field2"),
        );
      }).toList();

      setState(() {});
    } catch (e) {
      AppToastmsg.appToastMeassage("Error fetching modules data: $e");
    }
  }
}

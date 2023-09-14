// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_connect/components/flutter_toast.dart';

class Academic {
  final String yearsem;
  Academic({required this.yearsem});
}

class YearSemester {
  final String yearSemesterID;
  YearSemester({required this.yearSemesterID});
}

class Module {
  final String moduleID;
  final String field1;
  final String field2;
  final String field3;
  Module(
      {required this.moduleID,
      required this.field1,
      required this.field2,
      required this.field3});
}

class ProfileAcademicData extends StatefulWidget {
  final String yearsem;
  const ProfileAcademicData({super.key, required this.yearsem});

  @override
  _ProfileAcademicDataState createState() => _ProfileAcademicDataState();
}

class _ProfileAcademicDataState extends State<ProfileAcademicData> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(yearsem: "academic_id");
  late YearSemester yearSemester = YearSemester(yearSemesterID: widget.yearsem);

  List<Module> modules = [];
  List<Academic> academics = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return modules.isNotEmpty
        ? Flexible(
            fit: FlexFit.loose,
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : modules.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("No data available"),
                        ),
                      )
                    : ListView.builder(
                        itemCount: modules.length,
                        itemBuilder: (context, index) {
                          return Table(
                            columnWidths: const {
                              0: FixedColumnWidth(60.0),
                              2: FixedColumnWidth(30.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Text(modules[index].field1,
                                        style: const TextStyle(fontSize: 12.0)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Text(modules[index].field2,
                                        style: const TextStyle(fontSize: 12.0)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 2),
                                    child: Text(modules[index].field3,
                                        style: const TextStyle(fontSize: 12.0)),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
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
          .doc("academic_id")
          .collection(widget.yearsem)
          .doc('${widget.yearsem}_id')
          .collection("module")
          .get();

      modules = snapshot.docs.map((doc) {
        return Module(
            moduleID: doc.id,
            field1: doc.get("code"),
            field2: doc.get("title"),
            field3: doc.get("score"));
      }).toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage("Error fetching modules data");
    }
  }
}

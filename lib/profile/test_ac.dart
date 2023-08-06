// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserEventsScreen extends StatelessWidget {

//   Future<DocumentSnapshot<Map<String, dynamic>>> fetchUserEvents(
//       User user) async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> academicSnapshot =
//           await FirebaseFirestore.instance
//               .collection('users')
//               .doc(user.uid)
//               .collection('academic')
//               .doc('lK3rXcfOCHJoSSxxX5pY')
//               .get();

//       return academicSnapshot;
//     } catch (e) {
//       // Handle any Firestore retrieval exceptions
//       print('Failed to fetch user events: $e');
//       rethrow;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     return Scaffold(

//       body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//         future: fetchUserEvents(user!),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error fetching data: ${snapshot.error}'),
//             );
//           } else {
//             // Data has been fetched successfully
//             Map<String, dynamic>? academicData = snapshot.data?.data();

//             if (academicData == null || academicData.isEmpty) {
//               return Center(
//                 child: Text('No events found.'),
//               );
//             }

//             // Access the array field in the 'academic' document
//             List<dynamic> arrayField = academicData['dd'];

//             // Display the array elements
//             return ListView.builder(
//               itemCount: arrayField.length,
//               itemBuilder: (context, index) {
//                 dynamic element = arrayField[index];
//                 return ListTile(
//                   title: Text('Element $index'),
//                   subtitle: Text(element.toString()),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Academic {
//   final String academicID;
//   Academic({required this.academicID});
// }

// class YearSemester {
//   final String yearSemesterID;
//   YearSemester({required this.yearSemesterID});
// }

// class Module {
//   final String moduleID;
//   final String field1;
//   final String field2;
//   Module({required this.moduleID, required this.field1, required this.field2});
// }

// class FirestoreExample extends StatefulWidget {
//   @override
//   _FirestoreExampleState createState() => _FirestoreExampleState();
// }

// class _FirestoreExampleState extends State<FirestoreExample> {
//   final firestoreInstance = FirebaseFirestore.instance;
//   final User? user = FirebaseAuth.instance.currentUser;
//   final Academic academic = Academic(academicID: "academic_id");
//   final YearSemester yearSemester = YearSemester(yearSemesterID: "year1sem1");

//   List<Module> modules = [];
//   List<Academic> academici = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch and populate the modules list when the widget is created
//     fetchModulesData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Firestore Example")),
//       body: academici.isNotEmpty
//           ? ListView.builder(
//               itemCount: academici.length,
//               itemBuilder: (context, index1) {
//                 return Column(
//                   children: [
//                     Text("Module ID: ${academici[index1].academicID}"),
//                     // ListView.builder(
//                     //   itemCount: modules.length,
//                     //   itemBuilder: (context, index) {
//                     //     return ListTile(
//                     //       title: Text("Module ID: ${modules[index].moduleID}"),
//                     //       subtitle: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         children: [
//                     //           Text("Field 1: ${modules[index].field1}"),
//                     //           Text("Field 2: ${modules[index].field2}"),
//                     //         ],
//                     //       ),
//                     //     );
//                     //   },
//                     // ),
//                   ],
//                 );
//               })
//           : Center(
//               child: Text("No modules data found."),
//             ),
//     );
//   }

//   void fetchAcadamicData() async {
//     try {
//       final snapshot = await firestoreInstance
//           .collection("users")
//           .doc(user!.uid)
//           .collection("academic")
//           .doc(academic.academicID)
//           .collection(yearSemester.yearSemesterID)
//           .doc("year1sem1_id")
//           .collection("module")
//           .get();

//       // Convert the query snapshot to a list of Module objects
//       modules = snapshot.docs.map((doc) {
//         return Module(
//           moduleID: doc.id,
//           field1: doc.get("field1"),
//           field2: doc.get("field2"),
//         );
//       }).toList();

//       setState(() {});
//     } catch (e) {
//       print("Error fetching modules data: $e");
//     }
//   }

//   void fetchModulesData() async {
//     try {
//       final snapshot = await firestoreInstance
//           .collection("users")
//           .doc(user!.uid)
//           .collection("academic")
//           .doc(academic.academicID)
//           .collection(yearSemester.yearSemesterID)
//           .doc("year1sem1_id")
//           .collection("module")
//           .get();

//       // Convert the query snapshot to a list of Module objects
//       modules = snapshot.docs.map((doc) {
//         return Module(
//           moduleID: doc.id,
//           field1: doc.get("field1"),
//           field2: doc.get("field2"),
//         );
//       }).toList();

//       setState(() {});
//     } catch (e) {
//       print("Error fetching modules data: $e");
//     }
//   }
// }

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
  final String academicID;
  const FirestoreExample({super.key, required this.academicID});

  @override
  _FirestoreExampleState createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  //final Academic academic = Academic(academicID: "academic_id");

  List<Module> modules = [];
  List<Academic> academics = [];

  @override
  void initState() {
    super.initState();
    // Fetch and populate the modules list when the widget is created
    fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          modules.isNotEmpty // Check the modules list instead of academics list
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
                  child: Text("No data found."),
                ),
    );
  }

  void fetchModulesData() async {
    try {
      final snapshot = await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("academic")
          .doc("academic_id")
          .collection(widget.academicID)
          .doc('${widget.academicID}_id')
          .collection("module")
          .get();

      modules = snapshot.docs.map((doc) {
        return Module(
          moduleID: doc.id,
          field1: doc.get("code"),
          field2: doc.get("title"),
        );
      }).toList();

      // Update the widget state to reflect the changes
      setState(() {});
    } catch (e) {
      AppToastmsg.appToastMeassage("Error fetching modules data: $e");
    }
  }
}




// users (collection)
//   └── user_id (document)
//        └── academic (collection)
//               ├── year1sem1_id (document)
//                     ├── module(collection)
//                           └── module_id(document)
//                               ├── field1: value1
//                               └── field2: value2
//                     └── module(collection)
//                           └── module_id(document)
//                               ├── field1: value1
//                               └── field2: value2
//               ├── year1sem2_id (document)
//               └── year2sem2_id (document)





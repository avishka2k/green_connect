import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/flutter_toast.dart';

class Academic {
  final String academicID;
  Academic({required this.academicID});
}

class Module2 {
  final String moduleID;
  final String module;
  final String score;
  Module2({
    required this.moduleID,
    required this.module,
    required this.score,
  });
}

class AddRank extends StatefulWidget {
  const AddRank({super.key});

  @override
  State<AddRank> createState() => _AddRankState();
}

class _AddRankState extends State<AddRank> {
  final TextEditingController rank = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  final Academic academic = Academic(academicID: "academic_id");
  String? selectedItem;
  String? selectedItem1;
  List<Module> items = [];
  List<String> academicSem = [
    'year1sem1',
    'year1sem2',
    'year2sem1',
    'year2sem2',
    'year3sem1',
    'year3sem2',
    'year4sem1',
    'year4sem2',
    'test',
  ];

  final firestoreInstance = FirebaseFirestore.instance;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModulesData();
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  Future<void> fetchModulesData() async {
    try {
      final snapshot = await firestoreInstance.collection("module").get();

      items = snapshot.docs.map((doc) {
        return Module(
          itemsID: doc.id,
          name: doc.get('name'),
        );
      }).toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage("Error fetching modules data: $e");
    }
  }

  Future<void> _uploadRankData() async {
    if (rank.text.isEmpty) {
      return;
    }

    DocumentReference module =
        FirebaseFirestore.instance.collection('module').doc(selectedItem);

    // Add the modules to Firestore
    await firestoreInstance
        .collection("users")
        .doc(user!.uid)
        .collection("academic")
        .doc(academic.academicID)
        .collection(selectedItem1!)
        .doc('${selectedItem1}_id')
        .collection("module")
        .add({
      'module': module,
      'rank': rank.text,
    });

    await FirebaseFirestore.instance.collection('testm').add({
      // 'name': name.text,
      // 'code': code.text,
      // 'lecturer': lecturerRef,
    });

    setState(() {
      rank.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Rank')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            DropdownButtonFormField<String>(
              value: selectedItem1,
              items: academicSem.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(() {
                  selectedItem1 = val;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedItem,
              items: items.map<DropdownMenuItem<String>>(
                (Module value) {
                  return DropdownMenuItem<String>(
                    value: value.itemsID,
                    child: Text(
                      truncateText(value.name, 40),
                    ),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(() {
                  selectedItem = val;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            TextField(
              controller: rank,
              decoration: const InputDecoration(
                hintText: 'Rank',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _uploadRankData,
              child: const Text('Save Module'),
            ),
          ],
        ),
      ),
    );
  }
}

class Module {
  final String itemsID;
  final String name;

  Module({
    required this.itemsID,
    required this.name,
  });
}

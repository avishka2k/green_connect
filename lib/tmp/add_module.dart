import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/flutter_toast.dart';

class Module {
  final String itemsID;
  final String name;

  Module({
    required this.itemsID,
    required this.name,
  });
}

class AddModule extends StatefulWidget {
  const AddModule({super.key});

  @override
  State<AddModule> createState() => _AddModuleState();
}

class _AddModuleState extends State<AddModule> {
  final TextEditingController name = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController semester = TextEditingController();
  final TextEditingController credit = TextEditingController();

  String? selectedItem;
  List<Module> items = [];

  Future<void> _uploadLecturerData() async {
    if (name.text.isEmpty || code.text.isEmpty) {
      return;
    }

    DocumentReference lecturerRef =
        FirebaseFirestore.instance.collection('lecturers').doc(selectedItem);

    await FirebaseFirestore.instance.collection('module').add({
      'name': name.text,
      'code': code.text,
      'lecturer': lecturerRef,
      'semester': double.parse(semester.text),
      'credit': int.parse(credit.text),
    });

    setState(() {
      name.text = '';
      code.text = '';
      semester.text = '';
      credit.text = '';
    });
  }

  final firestoreInstance = FirebaseFirestore.instance;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModulesData();
  }

  Future<void> fetchModulesData() async {
    try {
      final snapshot = await firestoreInstance.collection("lecturers").get();

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add Module')),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: code,
                decoration: const InputDecoration(
                  hintText: 'Code',
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedItem,
                items: items.map<DropdownMenuItem<String>>(
                  (Module value) {
                    return DropdownMenuItem<String>(
                      value: value.itemsID,
                      child: Text(
                        value.name,
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
                keyboardType: TextInputType.number,
                controller: semester,
                decoration: const InputDecoration(
                  hintText: 'Semester',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: credit,
                decoration: const InputDecoration(
                  hintText: 'Credit',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: _uploadLecturerData,
                child: const Text('Save Module'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

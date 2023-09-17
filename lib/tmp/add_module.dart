import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddModule extends StatefulWidget {
  const AddModule({super.key});

  @override
  State<AddModule> createState() => _AddModuleState();
}

class _AddModuleState extends State<AddModule> {
  final TextEditingController name = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController lecturer = TextEditingController();
  final TextEditingController semester = TextEditingController();
  final TextEditingController credit = TextEditingController();

  Future<void> _uploadLecturerData() async {
    if (name.text.isEmpty || code.text.isEmpty) {
      return;
    }

    await FirebaseFirestore.instance.collection('module').add({
      'name': name.text,
      'code': code.text,
      'lecturer': lecturer.text,
      'semester': double.parse(semester.text),
      'credit': int.parse(credit.text),
    });

    setState(() {
      name.text = '';
      code.text = '';
      lecturer.text = '';
      semester.text = '';
      credit.text = '';
    });
  }

  String? selectedItem;

  List<String> items = [
    'Degree fee',
    'Bridging Programme',
    'Hostel Deposite',
    'Registration Fee',
    'Library Fee',
    'Convocation Fee',
    'Late Payment Fines',
    'Pre Payment',
    'Repeat Exam Fee',
    'Late Payment Charges',
    'Lateral Entry Fee',
    'Other Fine',
  ];

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
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
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

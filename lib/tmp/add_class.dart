import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/app_text_form_field.dart';
import 'package:green_connect/components/flutter_toast.dart';

class Module {
  final String itemsID;
  final String name;

  Module({
    required this.itemsID,
    required this.name,
  });
}

class AddClass extends StatefulWidget {
  const AddClass({super.key});

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  final TextEditingController location = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeStartController = TextEditingController();
  final TextEditingController _timeEndController = TextEditingController();

  String? selectedItem;
  String? selectedItemlec;
  List<Module> items = [];
  List<Module> lecturer = [];

  Future<void> _uploadLecturerData() async {
    if (_dateController.text.isEmpty || location.text.isEmpty) {
      return;
    }

    DocumentReference lecturerRef =
        FirebaseFirestore.instance.collection('lecturers').doc(selectedItemlec);
    DocumentReference moduleRef =
        FirebaseFirestore.instance.collection('module').doc(selectedItem);

    await FirebaseFirestore.instance.collection('todayLec').add({
      'module': moduleRef,
      'location': location.text,
      'lecturer': lecturerRef,
      'startTime': _timeStartController.text,
      'endTime': _timeEndController.text,
      'date': Timestamp.fromDate(DateTime.parse(_dateController.text)),
    });

    setState(() {
      // name.text = '';
      // location.text = '';
      // semester.text = '';
      // credit.text = '';
    });
  }

  final firestoreInstance = FirebaseFirestore.instance;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchModulesData();
    fetchLecData();
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

  Future<void> fetchLecData() async {
    try {
      final snapshot = await firestoreInstance.collection("lecturers").get();

      lecturer = snapshot.docs.map((doc) {
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

  void _date_picker() {
    DateTime selected_date = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        selected_date = value!;
        _dateController.text = selected_date.toLocal().toString();
      });
    });
  }

  void _time_picker(TextEditingController setTile) {
    TimeOfDay selectedTime = TimeOfDay.now();
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.inputOnly,
      context: context,
      initialTime: selectedTime,
    ).then((value) {
      setState(() {
        selectedTime = value!;
        setTile.text = selectedTime.format(context).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add Module')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
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
                DropdownButtonFormField<String>(
                  value: selectedItemlec,
                  items: lecturer.map<DropdownMenuItem<String>>(
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
                      selectedItemlec = val;
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
                  controller: location,
                  decoration: const InputDecoration(
                    hintText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                ),
                AppTextformfield(
                  keyboardType: TextInputType.datetime,
                  field_controller: _timeStartController,
                  errormsg: 'Please enter start time',
                  labelText: 'Start Time',
                  hintText: 'Pick Start Time',
                  suffix: const Icon(Icons.watch),
                  readOnly: true,
                  onTap: () {
                    _time_picker(_timeStartController);
                  },
                ),
                AppTextformfield(
                  field_controller: _dateController,
                  errormsg: 'Please enter date',
                  labelText: 'Date',
                  hintText: 'Pick date',
                  suffix: const Icon(Icons.calendar_month),
                  readOnly: true,
                  onTap: _date_picker,
                ),
                AppTextformfield(
                  field_controller: _timeEndController,
                  errormsg: 'Please enter end time',
                  labelText: 'End Time',
                  hintText: 'Pick End Time',
                  suffix: const Icon(Icons.watch),
                  readOnly: true,
                  onTap: () {
                    _time_picker(_timeEndController);
                  },
                ),
                ElevatedButton(
                  onPressed: _uploadLecturerData,
                  child: const Text('Save Module'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

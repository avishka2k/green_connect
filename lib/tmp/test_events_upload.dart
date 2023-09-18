// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeStartController = TextEditingController();
  final TextEditingController _timeEndController = TextEditingController();
  XFile? _imageFile;

  void _date_picker() {
    DateTime selected_date = DateTime.now();
    String formattedDate = '';
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        selected_date = value!;
        formattedDate = DateFormat('yyyy/MM/dd').format(selected_date);
        _dateController.text = formattedDate;
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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _uploadImageAndUserData() async {
    if (_imageFile == null ||
        _titleController.text.isEmpty ||
        _locationController.text.isEmpty) {
      return;
    }
    File imageFile = File(_imageFile!.path);

    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/events/${DateTime.now()}.png');
    await storageRef.putFile(imageFile);

    final String imageUrl = await storageRef.getDownloadURL();

    await FirebaseFirestore.instance.collection('events').add({
      'title': _titleController.text,
      'location': _locationController.text,
      'timeStart': _timeStartController.text,
      'timeEnd': _timeEndController.text,
      'date': _dateController.text,
      'about': _aboutController.text,
      'imageUrl': imageUrl,
    });

    setState(() {
      _titleController.text = '';
      _locationController.text = '';
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Events'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppTextformfield(
                field_controller: _titleController,
                errormsg: 'Please enter title',
                labelText: 'Title',
                hintText: 'Add a Title',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'About',
                      style: TextStyle(
                        fontSize: 15,
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      controller: _aboutController,
                      decoration: const InputDecoration(
                        hintText: 'Add a About',
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
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
                field_controller: _locationController,
                errormsg: 'Please enter location',
                labelText: 'Location',
                hintText: 'Add a Location',
                isValidate: false,
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 16.0),
              _imageFile != null
                  ? Image.file(
                      File(_imageFile!.path),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _uploadImageAndUserData,
                      child: const Text('Save User'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

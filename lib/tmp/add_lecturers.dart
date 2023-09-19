import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddLecturer extends StatefulWidget {
  const AddLecturer({super.key});

  @override
  State<AddLecturer> createState() => _AddLecturerState();
}

class _AddLecturerState extends State<AddLecturer> {
  final TextEditingController name = TextEditingController();
  final TextEditingController role = TextEditingController();

  XFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> _uploadLecturerData() async {
    if (_imageFile == null || role.text.isEmpty || name.text.isEmpty) {
      return;
    }
    File imageFile = File(_imageFile!.path);

    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/lecturer/${DateTime.now()}.png');
    await storageRef.putFile(imageFile);

    final String imageUrl = await storageRef.getDownloadURL();

    await FirebaseFirestore.instance.collection('lecturers').add({
      'name': name.text,
      'role': role.text,
      'imageUrl': imageUrl,
    });

    setState(() {
      name.text = '';
      role.text = '';
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Add Lecturer')),
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
                controller: role,
                decoration: const InputDecoration(
                  hintText: 'Role',
                  border: OutlineInputBorder(),
                ),
              ),
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
              ElevatedButton(
                onPressed: _uploadLecturerData,
                child: const Text('Add Lecturer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

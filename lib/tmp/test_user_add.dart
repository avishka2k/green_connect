// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  const AddUser(this.fullName, this.company, this.age, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: addUser,
          child: const Text(
            "Add User",
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:green_connect/components/flutter_toast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   XFile? image;

//   Future<void> _pickImage() async {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       image = pickedImage;
//     });
//   }

//   Future uploadImageToFirebase() async {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     if (image != null) {
//       final reference =
//           FirebaseStorage.instance.ref().child('images/$fileName');
//       final imageFile = File(image!.path);
//       var snapshot = await reference.putFile(imageFile).whenComplete(() => {});
//       var downloadUrl = await snapshot.ref.getDownloadURL();
//       print(downloadUrl);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Create a CollectionReference called users that references the firestore collection
//     CollectionReference users = FirebaseFirestore.instance.collection('users');

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             image == null
//                 ? Text('No image selected.')
//                 : Image.file(File(image!.path)),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             ElevatedButton(
//               onPressed: uploadImageToFirebase,
//               child: Text('Up Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

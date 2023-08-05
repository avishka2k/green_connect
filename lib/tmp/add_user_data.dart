import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataToFirebase extends StatefulWidget {
  @override
  _AddDataToFirebaseState createState() => _AddDataToFirebaseState();
}

class _AddDataToFirebaseState extends State<AddDataToFirebase> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  Future<User?> _createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Handle any authentication exceptions (e.g., email already in use)
      print('Failed to create user: ${e.message}');
      return null;
    }
  }

  Future<void> _uploadUsernameToFirestore(
    User user,
    String username,
    String email,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'username': username,
        'email': email,
      });
    } catch (e) {
      // Handle any Firestore upload exceptions
      print('Failed to upload username: $e');
    }
  }

  void _registerUserWithEmailAndPassword() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;

    User? user = await _createUserWithEmailAndPassword(email, password);
    if (user != null) {
      // User created successfully, now upload the username to Firestore
      await _uploadUsernameToFirestore(user, username, email);
      print('User registered successfully!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registerUserWithEmailAndPassword,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

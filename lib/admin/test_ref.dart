import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestRef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Firebase Reference Example'),
          ),
          body: const Column(
            children: [
              ElevatedButton(onPressed: addPost, child: Text('add')),
              ElevatedButton(onPressed: getPostAuthor, child: Text('get')),
            ],
          )),
    );
  }
}

void addPost() async {
  var firestore = FirebaseFirestore.instance;

  // Create a reference to a document (Replace 'author_id' with an actual user ID)
  DocumentReference authorRef =
      firestore.collection('testref').doc('author_id');

  // Create a new post
  await firestore.collection('posts').add({
    'title': 'My First Post',
    'author': authorRef,
  });
}

void getPostAuthor() async {
  var firestore = FirebaseFirestore.instance;

  var postSnapshot =
      await firestore.collection('posts').doc('pAw9Az1BAQ3p6XL7h5fW').get();

  if (postSnapshot.exists) {
    var postData = postSnapshot.data() as Map<String, dynamic>;
    DocumentReference authorRef = postData['author'];

    var authorSnapshot = await authorRef.get();

    if (authorSnapshot.exists) {
      var authorData = authorSnapshot.data() as Map<String, dynamic>;
      print('Author Name: ${authorData['name']}');
    } else {
      print('Author document does not exist');
    }
  } else {
    print('Post document does not exist');
  }
}

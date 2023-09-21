import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestRef extends StatefulWidget {
  @override
  _TestRefState createState() => _TestRefState();
}

class _TestRefState extends State<TestRef> {
  List<Map<String, dynamic>> authors = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Reference Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: addPost,
              child: Text('Add Post'),
            ),
            ElevatedButton(
              onPressed: getAllAuthors,
              child: Text('Get All Authors'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: authors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(authors[index]['name']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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

  void getAllAuthors() async {
    var firestore = FirebaseFirestore.instance;

    var querySnapshot = await firestore.collection('testref').get();

    if (querySnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> tempList = [];

      for (var doc in querySnapshot.docs) {
        var authorData = doc.data() as Map<String, dynamic>;
        tempList.add(authorData);
      }

      setState(() {
        authors = tempList;
      });
    } else {
      print('No authors found');
    }
  }
}

void main() {
  runApp(TestRef());
}

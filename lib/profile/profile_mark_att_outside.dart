import 'package:flutter/material.dart';
import 'package:green_connect/components/app_bar_with_back.dart';


class MarkAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const AppBarWithBack(title: "Mark attendance",),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You are attempting to mark attendance whilst being outside the lecture hall',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'This incident will be reported.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
            
              },
              child: const Text('Try again'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 36, 105, 38),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
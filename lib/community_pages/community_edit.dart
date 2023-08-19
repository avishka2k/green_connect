import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityEdit extends StatefulWidget {
  const CommunityEdit({Key? key}) : super(key: key);

  @override
  State<CommunityEdit> createState() => _CommunityEditState();
}

class _CommunityEditState extends State<CommunityEdit> {
  String userName = "Chamaka";
  double availableBalance = 5000.00;

  List<String> imagePaths = [
    'assets/images/io.png', // Replace with the actual path to your image assets
    'assets/images/dev.png',
    'assets/images/dev.png',
    'assets/images/io.png',
  ];

  List<String> itemTexts = [
    'Google I/O 2023', // Replace with the desired text for each item
    'Google I/O 2023',
    'Google I/O 2023',
    'Google I/O 2023',
  ];

  List<String> itemTexts1 = [
    'Google  2023', // Replace with the desired text for each item
    'Google  2023',
    'Google I/O 2023',
    'Google I/O 2023',
  ];

  bool isReactClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                    'assets/images/propic.png'), // Replace with the path to your profile picture asset
              ),
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Text(
              'Foss',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF18A689),
              ),
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_rounded),
                  color: const Color(0xFF18A689),
                  onPressed: () {
                    // Handle the right icon's onPressed event here
                  },
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Photo'),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your logic here to handle the button click
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00744A),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class communityhomepage extends StatefulWidget {
  const communityhomepage({Key? key}) : super(key: key);

  @override
  State<communityhomepage> createState() => _communityhomepageState();
}

int notificationCount = 5;

class _communityhomepageState extends State<communityhomepage> {
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
  // List<bool> containerFavorites = [false, false, false, false];
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
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                      'assets/images/propic.png'), // Replace with the path to your profile picture asset
                ),
              ),
              Spacer(),
              SizedBox(width: 8),
              Text(
                'Foss',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF18A689),
                ),
              ),
              Spacer(),
              SizedBox(width: 8),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_rounded),
                    color: Color(0xFF18A689),
                    onPressed: () {
                      // Handle the right icon's onPressed event here
                    },
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$notificationCount',
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
            child:Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(children: [

                  Center(

                      child:Container(
                        height: 500,
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),

                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Recent Posts', // Add your desired text here
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 0),
                              Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagePaths.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      bool isReactClicked =
                                      false; // Track if the React button is clicked

                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(20),
                                                    child: Image.asset(
                                                      imagePaths[index],
                                                      height: 100,
                                                      width: 140,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    itemTexts1[index],
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'Subtitle Text',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: Color(0xFF00744A),
                                                    ),
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          bottom: 0,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => csr()),
                                                              );
                                                              // Handle the "More" button click to navigate to another display
                                                              // You can use Navigator.push here
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Colors.white,

                                                            ),
                                                            child: Text(
                                                              'Edit',
                                                              style: GoogleFonts.inter(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF00744A),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          bottom: 0,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => csr()),
                                                              );
                                                              // Handle the "More" button click to navigate to another display
                                                              // You can use Navigator.push here
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Colors.white,

                                                            ),
                                                            child: Text(
                                                              'Delete',
                                                              style: GoogleFonts.inter(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF00744A),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              ),
                              SizedBox(height: 0),
                              Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: imagePaths.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      bool isReactClicked =
                                      false; // Track if the React button is clicked

                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          width: 140,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(20),
                                                    child: Image.asset(
                                                      imagePaths[index],
                                                      height: 100,
                                                      width: 140,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    itemTexts1[index],
                                                    style: GoogleFonts.inter(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5),
                                                  Text(
                                                    'Subtitle Text',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: Color(0xFF00744A),
                                                    ),
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          bottom: 0,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => Edit()),
                                                              );
                                                              // Handle the "More" button click to navigate to another display
                                                              // You can use Navigator.push here
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Colors.white,

                                                            ),
                                                            child: Text(
                                                              'Edit',
                                                              style: GoogleFonts.inter(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF00744A),
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          bottom: 0,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => csr()),
                                                              );
                                                              // Handle the "More" button click to navigate to another display
                                                              // You can use Navigator.push here
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                              primary: Colors.white,

                                                            ),
                                                            child: Text(
                                                              'Delete',
                                                              style: GoogleFonts.inter(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.normal,
                                                                color: Color(0xFF00744A),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ])
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )
                              ),
                              Center(

                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Add()),
                                    );
                                    // Handle the "More" button click to navigate to another display
                                    // You can use Navigator.push here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF00744A),

                                  ),
                                  child: Text(
                                    'Add Post',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )
                  ),

                ]))));
  }
}
//

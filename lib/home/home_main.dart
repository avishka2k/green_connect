import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

int notificationCount = 5;

class _HomeMainState extends State<HomeMain> {
  String userName = "Chamaka";
  double availableBalance = 5000.00;

  List<String> imagePaths = [
    'assets/images/io.png', // Replace with the actual path to your image assets
    'assets/images/dev.png',
    'assets/images/micro.png',
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
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(children: [
                  Center(
                    child: Container(
                      height: 170,
                      width: 370,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFF69D199), Colors.white],
                            // Replace Colors.blue with your desired second color
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  ' Hi, $userName',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    color: const Color(0xff4F4F4F),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ClipOval(
                                      child: ElevatedButton(
                                    onPressed: () {
                                      // Handle the "Add" button's onPressed event here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      // ignore: deprecated_member_use
                                      primary: const Color(0xFF18A689),
                                      // Background color of the button
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Row(children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                    ]),
                                  )))
                            ],
                          ),
                          const SizedBox(height: 0),
                          Text(
                            ' Rs.$availableBalance',
                            style: GoogleFonts.inter(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF18A689),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            '  Avalible Balance',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: const Color(0xff4F4F4F),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/paypal.png',
                                height: 30,
                                width: 40,
                              ), // Replace with your image
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/images/pngegg.png',
                                height: 30,
                                width: 40,
                              ), // Replace with your image
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/images/visa.png',
                                height: 30,
                                width: 40,
                              ),
                              const SizedBox(
                                  width: 10), // Replace with your image
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                        height: 150,
                        width: 360,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Today Lectures', // Today Lectures text
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Add some spacing between the text and other widgets

                            Text(
                              'Mobile Application development ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: const Color(0xff00744A),
                              ),
                            ),

                            // Padding(
                            //     padding:
                            //         const EdgeInsets.symmetric(horizontal: 8.0),
                            //
                            //         child: ElevatedButton(
                            //       onPressed: () {
                            //         // Handle the "Add" button's onPressed event here
                            //       },
                            //
                            //       child: Row(children: [
                            //         Icon(
                            //           Icons.arrow_drop_down_circle_outlined,
                            //           size: 20,
                            //           color: Color(0xff4F4F4F),
                            //         ),
                            //         SizedBox(width: 5),
                            //       ]),
                            //     ))
                            const SizedBox(height: 5),

                            Text(
                              '1:00 PM - 4.00 PM (UTC) ',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: const Color(0xff00744A),
                              ),
                            ),

                            Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                // Adjust the value as needed
                                child: Expanded(
                                    child: Row(children: [
                                  InkWell(
                                    onTap: () {},
                                    child: const CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage(
                                          'assets/images/propic.png'), // Replace with the path to your profile picture asset
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Mr. Sanka Piris',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFF00744A),
                                    ),
                                  ),
                                ]))),
                            Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                // Adjust the value as needed
                                child: Expanded(
                                    child: Row(children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xFF00744A),
                                    // Replace with the desired color for the icon
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'FOC - C1-L- 009',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: const Color(0xFF00744A),
                                    ),
                                  ),
                                ])))
                          ],
                        )),
                  ),
                  const SizedBox(height: 20),
                  // Add some spacing between the first and second containers

                  // Second Container
                  SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                'Upcoming Events', // Add your desired text here
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                                child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: imagePaths.length,
                              itemBuilder: (BuildContext context, int index) {
                                bool isReactClicked =
                                    false; // Track if the React button is clicked

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                imagePaths[index],
                                                height: 100,
                                                width: 140,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              itemTexts[index],
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              'Subtitle Text',
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: const Color(0xFF00744A),
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isReactClicked =
                                                            !isReactClicked;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      (isReactClicked == true)
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: (isReactClicked ==
                                                              true)
                                                          ? Colors.red
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    right: 0,
                                                    bottom: 0,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Handle the "More" button click to navigate to another display
                                                        // You can use Navigator.push here
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        // ignore: deprecated_member_use
                                                        primary: Colors.white,
                                                        // shadowColor: Colors.transparent,
                                                        //  shape: RoundedRectangleBorder(
                                                        //    borderRadius: BorderRadius.only(
                                                        //      bottomLeft: Radius.circular(20),
                                                        //      bottomRight: Radius.circular(20),
                                                        //    ),
                                                        //  ),
                                                      ),
                                                      child: Text(
                                                        'More',
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: const Color(
                                                              0xFF00744A),
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
                            )),
                          ])),
                  const SizedBox(height: 20),
                  // Add some spacing between the first and second containers

                  // Second Container
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Upcoming Activity', // Add your desired text here
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                              child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imagePaths.length,
                            itemBuilder: (BuildContext context, int index) {
                              bool isReactClicked =
                                  false; // Track if the React button is clicked

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              imagePaths[index],
                                              height: 100,
                                              width: 140,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            itemTexts1[index],
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Subtitle Text',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: const Color(0xFF00744A),
                                            ),
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isReactClicked =
                                                          !isReactClicked;
                                                    });
                                                  },
                                                  icon: Icon(
                                                    (isReactClicked == true)
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color:
                                                        (isReactClicked == true)
                                                            ? Colors.red
                                                            : Colors.black,
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      // Handle the "More" button click to navigate to another display
                                                      // You can use Navigator.push here
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      // ignore: deprecated_member_use
                                                      primary: Colors.white,
                                                      // shadowColor: Colors.transparent,
                                                      //  shape: RoundedRectangleBorder(
                                                      //    borderRadius: BorderRadius.only(
                                                      //      bottomLeft: Radius.circular(20),
                                                      //      bottomRight: Radius.circular(20),
                                                      //    ),
                                                      //  ),
                                                    ),
                                                    child: Text(
                                                      'More',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: const Color(
                                                            0xFF00744A),
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
                          ))
                        ]),
                  )
                ]))));
  }
}
//

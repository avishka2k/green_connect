import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

int notificationCount = 5;

class _CommunityPageState extends State<CommunityPage> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'CSR Projects', // Add your desired text here
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
                      const SizedBox(height: 0),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 240,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: imagePaths.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      imagePaths[index],
                                      height: 130,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemTexts[index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          'Subtitle Text',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF00744A),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                                color: (isReactClicked == true)
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'More',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF00744A),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Upcoming Events', // Add your desired text here
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
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 240,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: false,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemCount: imagePaths.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Material(
                              borderRadius: BorderRadius.circular(8),
                              elevation: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      imagePaths[index],
                                      height: 130,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          itemTexts[index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Text(
                                          'Subtitle Text',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xFF00744A),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                                color: (isReactClicked == true)
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'More',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xFF00744A),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
              //
              // Container(
              //     height: 300,
              //     width: double.infinity,
              //     child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //             child: Row(
              //               children: [
              //                 Expanded(
              //                   child: Text(
              //                     'IEEE', // Add your desired text here
              //                     style: GoogleFonts.inter(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.black,
              //                     ),
              //                   ),
              //                 ),
              //                 ElevatedButton(
              //                   onPressed: () {
              //                     // Handle the "Follow" button click here
              //                   },
              //                   style: ElevatedButton.styleFrom(
              //                     primary: Color(0xFF18A689),
              //                     shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(20),
              //                     ),
              //                     minimumSize: Size(30, 30),
              //
              //                   ),
              //                   child: Text(
              //                     'Follow',
              //                     style: TextStyle(
              //                       fontSize: 12,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //
              //           SizedBox(height: 5),
              //           Expanded(
              //               child:ListView.builder(
              //                 scrollDirection: Axis.horizontal,
              //                 itemCount: imagePaths.length,
              //                 itemBuilder: (BuildContext context, int index) {
              //                   bool isReactClicked =
              //                   false; // Track if the React button is clicked
              //
              //                   return Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 10),
              //                     child: Container(
              //                       width: 140,
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.circular(20),
              //                       ),
              //                       child: Stack(
              //                         alignment: Alignment.bottomRight,
              //                         children: [
              //                           Column(
              //                             mainAxisAlignment: MainAxisAlignment.center,
              //                             crossAxisAlignment:
              //                             CrossAxisAlignment.center,
              //                             children: [
              //                               ClipRRect(
              //                                 borderRadius: BorderRadius.circular(20),
              //                                 child: Image.asset(
              //                                   imagePaths[index],
              //                                   height: 100,
              //                                   width: 140,
              //                                   fit: BoxFit.cover,
              //                                 ),
              //                               ),
              //                               SizedBox(height: 10),
              //                               Text(
              //                                 itemTexts[index],
              //                                 style: GoogleFonts.inter(
              //                                   fontSize: 14,
              //                                   fontWeight: FontWeight.normal,
              //                                   color: Colors.black,
              //                                 ),
              //                               ),
              //                               SizedBox(height: 5),
              //                               Text(
              //                                 'Subtitle Text',
              //                                 style: GoogleFonts.inter(
              //                                   fontSize: 12,
              //                                   fontWeight: FontWeight.normal,
              //                                   color: Color(0xFF00744A),
              //                                 ),
              //                               ),
              //                               Row(
              //                                   mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                                   children: [
              //                                     IconButton(
              //                                       onPressed: () {
              //                                         setState(() {
              //                                           isReactClicked =
              //                                           !isReactClicked;
              //                                         });
              //                                       },
              //                                       icon: Icon(
              //                                         (isReactClicked == true)
              //                                             ? Icons.favorite
              //                                             : Icons.favorite_border,
              //                                         color: (isReactClicked == true)
              //                                             ? Colors.red
              //                                             : Colors.black,
              //                                       ),
              //                                     ),
              //                                     Positioned(
              //                                       left: 0,
              //                                       right: 0,
              //                                       bottom: 0,
              //                                       child: ElevatedButton(
              //                                         onPressed: () {
              //                                           // Handle the "More" button click to navigate to another display
              //                                           // You can use Navigator.push here
              //                                         },
              //                                         style: ElevatedButton.styleFrom(
              //                                           primary: Colors.white,
              //                                           // shadowColor: Colors.transparent,
              //                                           //  shape: RoundedRectangleBorder(
              //                                           //    borderRadius: BorderRadius.only(
              //                                           //      bottomLeft: Radius.circular(20),
              //                                           //      bottomRight: Radius.circular(20),
              //                                           //    ),
              //                                           //  ),
              //                                         ),
              //                                         child: Text(
              //                                           'More',
              //                                           style: GoogleFonts.inter(
              //                                             fontSize: 12,
              //                                             fontWeight: FontWeight.normal,
              //                                             color: Color(0xFF00744A),
              //                                           ),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ])
              //                             ],
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   );
              //                 },
              //               )
              //           ),
              //         ])),
              // SizedBox(height: 20),
              // Add some spacing between the first and second containers

              // Second Container
              // Container(
              //   height: 300,
              //   width: double.infinity,
              //   child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: Text(
              //                   'Maths Circle', // Add your desired text here
              //                   style: GoogleFonts.inter(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold,
              //                     color: Colors.black,
              //                   ),
              //                 ),
              //               ),
              //               ElevatedButton(
              //                 onPressed: () {
              //                   // Handle the "Follow" button click here
              //                 },
              //                 style: ElevatedButton.styleFrom(
              //                   primary: Color(0xFF18A689),
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(20),
              //                   ),
              //                   minimumSize: Size(30, 30),
              //
              //                 ),
              //                 child: Text(
              //                   'Follow',
              //                   style: TextStyle(
              //                     fontSize: 12,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         // Add other widgets for the rest of the content
              //
              //
              //         SizedBox(height: 10),
              //         Expanded(
              //             child: ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               itemCount: imagePaths.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 bool isReactClicked =
              //                 false; // Track if the React button is clicked
              //
              //                 return Padding(
              //                   padding: EdgeInsets.symmetric(horizontal: 10),
              //                   child: Container(
              //                     width: 140,
              //                     decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(20),
              //                     ),
              //                     child: Stack(
              //                       alignment: Alignment.bottomRight,
              //                       children: [
              //                         Column(
              //                           mainAxisAlignment: MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                           CrossAxisAlignment.center,
              //                           children: [
              //                             ClipRRect(
              //                               borderRadius: BorderRadius.circular(20),
              //                               child: Image.asset(
              //                                 imagePaths[index],
              //                                 height: 100,
              //                                 width: 140,
              //                                 fit: BoxFit.cover,
              //                               ),
              //                             ),
              //                             SizedBox(height: 10),
              //                             Text(
              //                               itemTexts1[index],
              //                               style: GoogleFonts.inter(
              //                                 fontSize: 14,
              //                                 fontWeight: FontWeight.normal,
              //                                 color: Colors.black,
              //                               ),
              //                             ),
              //                             SizedBox(height: 5),
              //                             Text(
              //                               'Subtitle Text',
              //                               style: GoogleFonts.inter(
              //                                 fontSize: 12,
              //                                 fontWeight: FontWeight.normal,
              //                                 color: Color(0xFF00744A),
              //                               ),
              //                             ),
              //                             Row(
              //                                 mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                                 children: [
              //                                   IconButton(
              //                                     onPressed: () {
              //                                       setState(() {
              //                                         isReactClicked =
              //                                         !isReactClicked;
              //                                       });
              //                                     },
              //                                     icon: Icon(
              //                                       (isReactClicked == true)
              //                                           ? Icons.favorite
              //                                           : Icons.favorite_border,
              //                                       color: (isReactClicked == true)
              //                                           ? Colors.red
              //                                           : Colors.black,
              //                                     ),
              //                                   ),
              //                                   Positioned(
              //                                     left: 0,
              //                                     right: 0,
              //                                     bottom: 0,
              //                                     child: ElevatedButton(
              //                                       onPressed: () {
              //                                         // Handle the "More" button click to navigate to another display
              //                                         // You can use Navigator.push here
              //                                       },
              //                                       style: ElevatedButton.styleFrom(
              //                                         primary: Colors.white,
              //                                         // shadowColor: Colors.transparent,
              //                                         //  shape: RoundedRectangleBorder(
              //                                         //    borderRadius: BorderRadius.only(
              //                                         //      bottomLeft: Radius.circular(20),
              //                                         //      bottomRight: Radius.circular(20),
              //                                         //    ),
              //                                         //  ),
              //                                       ),
              //                                       child: Text(
              //                                         'More',
              //                                         style: GoogleFonts.inter(
              //                                           fontSize: 12,
              //                                           fontWeight: FontWeight.normal,
              //                                           color: Color(0xFF00744A),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ])
              //                           ],
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               },
              //             )
              //         )
              //       ]),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
//

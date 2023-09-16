// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';

class AppEventsCard extends StatefulWidget {
  final String title;
  final String? card_title;
  final String? card_subtitle;
  final String? card_image;
  const AppEventsCard({
    required this.title,
    this.card_title,
    this.card_subtitle,
    this.card_image,
    super.key,
  });

  @override
  State<AppEventsCard> createState() => _AppEventsCardState();
}

class _AppEventsCardState extends State<AppEventsCard> {
  List<String> imagePaths = [
    'assets/images/io.png', 
    'assets/images/dev.png',
    'assets/images/dev.png',
    'assets/images/io.png',
  ];

  List<String> itemTexts = [
    'Google I/O 2023', 
    'Google I/O 2023',
    'Google I/O 2023',
    'Google I/O 2023',
  ];

  List<String> itemTexts1 = [
    'Google  2023', 
    'Google  2023',
    'Google I/O 2023',
    'Google I/O 2023',
  ];
  
  bool isReactClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: appBlack,
            ),
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
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
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
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isReactClicked = !isReactClicked;
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
    );
  }
}

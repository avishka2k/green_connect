import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/models/events.dart';
import 'package:green_connect/payment/payment_top_up.dart';
import 'package:intl/intl.dart';

class HomeMain extends StatefulWidget {
  HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int notificationCount = 5;

  String userName = "Chamaka";

  double availableBalance = 5000.00;

  List<String> imagePaths = [
    'assets/images/io.png',
    'assets/images/dev.png',
    'assets/images/micro.png',
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

  final firestoreInstance = FirebaseFirestore.instance;
  List<Events> event = [];
  bool isLoading = true;
  @override
  void initState() {
    fetchModulesData();
    super.initState();
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection =
          await firestoreInstance.collection("events").get();

      event = remindCollection.docs.map((doc) {
        return Events(
          eventID: doc.id,
          title: doc.get("title"),
          about: doc.get("about"),
          location: doc.get("location"),
          timeStart: doc.get("timeStart").toDate(),
          timeEnd: doc.get("timeEnd").toDate(),
          imageUrl: doc.get("imageUrl"),
        );
      }).toList();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFF69D199),
                      Color.fromARGB(176, 179, 236, 212),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            ' Hi, Chamaka',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color(0xff4F4F4F),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: appPrimary,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentTopUp(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        ' Rs.5000.00',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: appPrimary,
                        ),
                      ),
                      const Text(
                        '  Available Balance',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: appBlack,
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
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/images/pngegg.png',
                            height: 30,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/images/visa.png',
                            height: 30,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Today Lectures', // Today Lectures text
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: appBlack,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Mobile Application development ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff00744A),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '1:00 PM - 4.00 PM (UTC) ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Color(0xff00744A),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(
                                  'assets/images/propic.png',
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'Mr. Sanka Piris',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF00744A),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0xFF00744A),
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'FOC - C1-L- 009',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF00744A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Upcoming Events', // Add your desired text here
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: appBlack,
                  ),
                ),
              ),
              isLoading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : event.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text("No Upcoming Events"),
                          ),
                        )
                      : CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemCount: event.length,
                          itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) {
                            String eventdate = DateFormat('E, MMM d, y')
                                .format(event[index].timeStart);

                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EventDetialsPage(
                                        eventId: event[index].eventID,
                                      ),
                                    ),
                                  );
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(8),
                                  elevation: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.black,
                                            ),
                                            child: Opacity(
                                              opacity: 0.7,
                                              child: Image.network(
                                                event[index]
                                                    .imageUrl
                                                    .toString(),
                                                height: 130,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isReactClicked =
                                                      !isReactClicked;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                fill: 1,
                                                color: (isReactClicked == true)
                                                    ? Colors.red
                                                    : Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
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
                                              event[index].title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              eventdate,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xFF00744A),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Upcoming Activity',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: appBlack,
                  ),
                ),
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
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
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black,
                                ),
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Image.asset(
                                    imagePaths[index],
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isReactClicked = !isReactClicked;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    fill: 1,
                                    color: (isReactClicked == true)
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                ),
                              )
                            ],
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
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/community_pages/community_top_up.dart';
import 'package:green_connect/components/app_events_card.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/models/events.dart';
import 'package:intl/intl.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

int notificationCount = 5;

class _CommunityPageState extends State<CommunityPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: appPagePadding,
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              AppEventsCardCSr(
                listTitle: 'CSR Projects',
                colName: 'comcsr',
                clickCard: 'EventDetialsPage',
                searchQuery: searchQuery,
              ),
              const SizedBox(
                height: 10,
              ),
              const AppEventsCard(
                listTitle: 'Events',
                colName: 'comevents',
                clickCard: 'ComView',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//

class AppEventsCardCSr extends StatefulWidget {
  final String listTitle;
  final String colName;
  final String clickCard;
  final String searchQuery;

  const AppEventsCardCSr({
    required this.listTitle,
    required this.colName,
    required this.clickCard,
    required this.searchQuery,
    super.key,
  });

  @override
  State<AppEventsCardCSr> createState() => _AppEventsCardCSrState();
}

class _AppEventsCardCSrState extends State<AppEventsCardCSr> {
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
          await firestoreInstance.collection(widget.colName).get();

      event = remindCollection.docs.map((doc) {
        return Events(
          eventID: doc.id,
          title: doc.get("title"),
          timeStart: doc.get("timeStart").toDate(),
          imageUrl: doc.get("imageUrl"),
        );
      }).toList();

      // Filter events based on search query
      if (widget.searchQuery.isNotEmpty) {
        event = event
            .where((e) => e.title.toLowerCase().contains(widget.searchQuery))
            .toList();
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            widget.listTitle,
            style: const TextStyle(
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
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text('No ${widget.listTitle}'),
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
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      String eventdate = DateFormat('E, MMM d, y')
                          .format(event[index].timeStart);

                      Widget StoWconvert(String widgetName) {
                        switch (widgetName) {
                          case 'EventDetialsPage':
                            return EventDetialsPage(
                              eventId: event[index].eventID,
                            );
                          default:
                            return Container();
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommunityTopUp(),
                              ),
                            );
                          },
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
                                        child: Image.network(
                                          event[index].imageUrl.toString(),
                                          height: 130,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
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
      ],
    );
  }
}

// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/home/home_events_details.dart';
import 'package:green_connect/models/events.dart';
import 'package:intl/intl.dart';

class AppEventsCard extends StatefulWidget {
  final String listTitle;
  final String colName;
  final String clickCard;

  const AppEventsCard({
    required this.listTitle,
    required this.colName,
    required this.clickCard,
    super.key,
  });

  @override
  State<AppEventsCard> createState() => _AppEventsCardState();
}

class _AppEventsCardState extends State<AppEventsCard> {
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

                      Widget navigate = StoWconvert(widget.clickCard);

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => navigate,
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

class StringToWidgetConverter {
  static Widget convert(String widgetName) {
    switch (widgetName) {
      case 'EventDetialsPage':
        return EventDetialsPage();
      default:
        return Container();
    }
  }
}

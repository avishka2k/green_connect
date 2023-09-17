import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_events_card.dart';
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
              const AppEventsCard(
                listTitle: 'Upcoming Events',
                colName: 'events',
                clickCard: 'EventDetialsPage',
              ),
              const AppEventsCard(
                listTitle: 'Upcoming Activity',
                colName: 'activities',
                clickCard: 'EventDetialsPage',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

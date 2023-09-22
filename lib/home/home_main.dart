import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_events_card.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/models/myclass.dart';
import 'package:green_connect/payment/payment_top_up.dart';
import 'package:green_connect/tmp/qr_screen.dart';
import 'package:intl/intl.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int notificationCount = 5;
  String userName = '';
  double availableBalance = 0.00;
  User? user = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;
  List<MyClass> myclass = [];
  bool isLoading = true;
  String currentDate = DateFormat('y-MM-dd').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    getUserDate();
    fetchModulesData();
  }

  Future<void> getUserDate() async {
    try {
      final userData = await firestore.collection('users').doc(user!.uid).get();
      if (userData.exists) {
        setState(() {
          userName = userData['name'];
          availableBalance = userData['balance'];
        });
      } else {
        AppToastmsg.appToastMeassage('User data not found in Firestore');
      }
    } catch (e) {
      AppToastmsg.appToastMeassage('Failed to fetch user data: $e');
    }
  }

  String capitalizeFirstName(String name) {
    List<String> item = name.split(' ');
    String input = item[0];
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1);
  }

  Future<void> _refreshData() async {
    await getUserDate();
    await fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    String firstName = capitalizeFirstName(userName);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
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
                            Text(
                              ' Hi, $firstName',
                              style: const TextStyle(
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
                        Text(
                          ' Rs $availableBalance',
                          style: const TextStyle(
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
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Today Lectures',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: appBlack,
                    ),
                  ),
                ),
                isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : myclass.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Center(
                              child: Text("No class available"),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: myclass.length,
                            itemBuilder: (context, index) {
                              // String eventdate = DateFormat('E, MMM d, y')
                              //     .format(myclass[index]['date']);
                              if (myclass.isEmpty) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 100),
                                  child: Center(
                                    child: Text("No Class available"),
                                  ),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => EventDetialsPage(
                                    //       eventId: widget.events[index].eventID,
                                    //     ),
                                    //   ),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QrScanner(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400,
                                            //spreadRadius: 1,
                                            blurRadius: 1,
                                            blurStyle: BlurStyle.solid,
                                            offset: Offset.zero,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 5),
                                            Text(
                                              myclass[index].module,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Color(0xff00744A),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              '${myclass[index].startTime} - ${myclass[index].endTime} (UTC)',
                                              style: const TextStyle(
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
                                                  child: CircleAvatar(
                                                    radius: 12,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      myclass[index]
                                                          .lecturerImage,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  myclass[index].lecturerName,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xFF00744A),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Color(0xFF00744A),
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    myclass[index].location,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                );
                              }
                            },
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
      ),
    );
  }

  Future<void> fetchModulesData() async {
    try {
      final currentDate = DateTime.now();
      final startOfToday =
          DateTime(currentDate.year, currentDate.month, currentDate.day);
      final endOfToday = startOfToday.add(const Duration(days: 1));

      final remindCollection = await firestore
          .collection('todayLec')
          .where('date',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfToday))
          .where('date', isLessThan: Timestamp.fromDate(endOfToday))
          .get();

      myclass = await Future.wait(remindCollection.docs.map((doc) async {
        DocumentReference moduleRef = doc.get('module');
        DocumentReference lecturerRef = doc.get('lecturer');
        DocumentSnapshot moduleSnapshot = await moduleRef.get();
        DocumentSnapshot lecturerSnapshot = await lecturerRef.get();

        String moduleName = moduleSnapshot.get('name');
        String lecturerName = lecturerSnapshot.get('name');
        String lecturerImage = lecturerSnapshot.get('imageUrl');

        return MyClass(
          classID: doc.id,
          module: moduleName,
          location: doc.get("location"),
          lecturerImage: lecturerImage,
          lecturerName: lecturerName,
          startTime: doc.get('startTime'),
          date: doc.get("date").toDate(),
          endTime: doc.get('endTime'),
        );
      }).toList());

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
      AppToastmsg.appToastMeassage('Error fetching modules data: $e');
    }
  }
}

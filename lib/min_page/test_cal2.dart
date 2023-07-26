import '../min_page/test_cal.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class test_cal2 extends StatefulWidget {
  const test_cal2({super.key});

  @override
  State<test_cal2> createState() => _test_cal2State();
}

class _test_cal2State extends State<test_cal2> {
  List<String> posts = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: 250,
                expandedHeight: 250,
                flexibleSpace: CalendarScreen(),
              ),
              SliverPersistentHeader(
                delegate: MyDelegate(const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.grid_on)),
                    Tab(icon: Icon(Icons.favorite_border_outlined)),
                  ],
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                )),
                floating: true,
                pinned: true,
              )
            ];
          },
          body: TabBarView(children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: posts
                  .map(
                    (e) => Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x7a69D199).withOpacity(0.5),
                            const Color(0xff69D199).withOpacity(0.4),
                          ],
                          stops: const [0, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e,
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor("#00744A"),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "12:00 AM - 1.00 PM (UTC)",
                            style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#00744A"),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: HexColor("#00744A"),
                                size: 18,
                              ),
                              Text(
                                "library",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: HexColor("#00744A"),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 1,
              shrinkWrap: true,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              children: posts
                  .map(
                    (e) => Container(
                      width: double.infinity,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x7a69D199).withOpacity(0.5),
                            const Color(0xff69D199).withOpacity(0.4),
                          ],
                          stops: const [0, 1],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e,
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor("#00744A"),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "12:00 AM - 1.00 PM (UTC)",
                            style: TextStyle(
                                fontSize: 12,
                                color: HexColor("#00744A"),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: HexColor("#00744A"),
                                size: 18,
                              ),
                              Text(
                                "library",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: HexColor("#00744A"),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            )
          ]),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}



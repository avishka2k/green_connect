import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:green_connect/community_pages/community_home_page.dart';
import 'package:green_connect/community_pages/community_main.dart';
import 'package:green_connect/community_pages/community_search.dart';
import 'package:green_connect/components/app_bar_with_menu.dart';
import 'package:green_connect/home/home_main.dart';
import 'package:green_connect/profile/profile_main.dart';
import 'package:green_connect/side_menu/side_menu.dart';
import 'app_color.dart';
import 'calendar/calendar_main.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/community_pages/community_page.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeMain(),
    CalendarMain(),
    CommunityPage(),
    // Text(
    //   'Search',
    //   style: optionStyle,
    // ),
    ProfileMain()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithMenu(
        title: "Add Remind",
        notifications: 4,
      ),
      drawer: const SideMenu(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Theme.of(context).primaryColor,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: appBlack,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.calendar_month_outlined,
                text: 'Calendar',
              ),
              GButton(
                icon: Icons.groups,
                text: 'Community',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

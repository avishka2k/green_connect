import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:green_connect/profile/profile_main.dart';

import 'app_color.dart';
import 'min_page/page_calendar.dart';
import 'min_page/page_home.dart';
import 'min_page/test_cal.dart';
import 'min_page/test_cal2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
    Text(
      'Home',
      style: optionStyle,
    ),
    PageCalender(),
    Text(
      'Search',
      style: optionStyle,
    ),
    ProfileMain()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
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
              color: appBlackhelf,
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
                  icon: Icons.search,
                  text: 'Search',
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
      ),
    );
  }
}

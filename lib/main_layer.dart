import 'package:calendar_test/min_page/page_calendar.dart';
import 'package:calendar_test/min_page/page_home.dart';
import 'package:calendar_test/min_page/test_cal.dart';
import 'package:calendar_test/min_page/test_cal2.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainLaye extends StatefulWidget {
  const MainLaye({super.key});

  @override
  State<MainLaye> createState() => _MainLayeState();
}

class _MainLayeState extends State<MainLaye> {
  int currentTab = 0;
  final List screens = [
    const PageHome(),
    const PageCalender(),
    CalendarScreen(),
    // const scanner(),
    // qr_generate(),
    // const history(),
    // const setting()
  ];
  Widget currentScreen = const PageHome();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: currentScreen,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  100), // Set the border radius to create a rounded rectangle
            ),
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.qr_code_scanner_sharp,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                //currentScreen = const scanner();
                currentTab = 0;
              });
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 10,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const PageHome();
                      currentTab = 1;
                    });
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: currentTab == 1
                        ? Theme.of(context).primaryColor
                        : HexColor("#3C3C3C"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = const PageCalender();
                      currentTab = 2;
                    });
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: currentTab == 2
                        ? Theme.of(context).primaryColor
                        : HexColor("#3C3C3C"),
                  ),
                ),
                const SizedBox(width: 50),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = CalendarScreen();
                      currentTab = 3;
                    });
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: currentTab == 3
                        ? Theme.of(context).primaryColor
                        : HexColor("#3C3C3C"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = test_cal2();
                      currentTab = 4;
                    });
                  },
                  icon: Icon(
                    Icons.home_rounded,
                    size: 25,
                    color: currentTab == 4
                        ? Theme.of(context).primaryColor
                        : HexColor("#3C3C3C"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

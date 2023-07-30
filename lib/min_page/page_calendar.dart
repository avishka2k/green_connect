import '../components/app_bar_with_menu.dart';
import '../components/calendar_remind_card.dart';
//import '../components/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class PageCalender extends StatefulWidget {
  const PageCalender({super.key});

  @override
  State<PageCalender> createState() => _PageCalenderState();
}

class _PageCalenderState extends State<PageCalender> {
  DateTime selectedDate = DateTime.now();
  int selectedDay = DateTime.now().day;
  ScrollController scrollController = ScrollController();
  int selectedTabIndex = 0; // 0 for Class tab, 1 for Events tab
  late bool _isLoading;

  void changeMonth(int increment) {
    setState(() {
      selectedDate = DateTime(
          selectedDate.year, selectedDate.month + increment, selectedDate.day);
      selectedDay =
          DateTime(selectedDate.year, selectedDate.month, selectedDay).day;
    });
  }

  void changeDay(int day) {
    setState(() {
      int maxDays = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
      if (day < 1 || day > maxDays) {
        // Change to the next month
        int increment = day > maxDays ? 1 : -1;
        selectedDate = DateTime(selectedDate.year,
            selectedDate.month + increment, selectedDate.day);
        selectedDay = DateTime(selectedDate.year, selectedDate.month, 1).day;
        scrollController.jumpTo(0);
      } else {
        selectedDay = day;
        double offset = (day - 3) * 70.0; // Adjust the value as per your design
        scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void selectTab(int tabIndex) {
    setState(() {
      selectedTabIndex = tabIndex;
    });
  }

  List<Widget> buildDayContainers() {
    int maxDays = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    int startDay = selectedDay - 2;
    int endDay = selectedDay + 2;

    if (startDay < 1) {
      endDay += (1 - startDay);
      startDay = 1;
    }

    if (endDay > maxDays) {
      startDay -= (endDay - maxDays);
      endDay = maxDays;
    }

    List<Widget> containers = [];
    for (int day = startDay; day <= endDay; day++) {
      DateTime date = DateTime(selectedDate.year, selectedDate.month, day);
      String dayName = DateFormat.E().format(date).substring(0, 3);

      containers.add(
        GestureDetector(
          onTap: () => changeDay(day),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color:
                    selectedDay == day ? Theme.of(context).primaryColor : null,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: selectedDay == day ? Colors.white : null,
                  ),
                ),
                Text(
                  '$day',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: selectedDay == day ? Colors.white : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return containers;
  }

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat.MMMM().format(selectedDate);

    return Scaffold(
      appBar: AppBarWithMenu(
        title: "Calendar",
        notifications: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            //TopBar(title: "Calendar"),
            Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: HexColor("#D4E8DD"),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => changeMonth(-1),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                      Text(
                        '$monthName, ${selectedDate.year}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () => changeMonth(1),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Day select row
                SingleChildScrollView(
                  //scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => changeDay(selectedDay - 1),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor("#D9D9D9"),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                      ...buildDayContainers(),
                      GestureDetector(
                        onTap: () => changeDay(selectedDay + 1),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: HexColor("#D9D9D9"),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Class and events tab row
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => selectTab(0),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: selectedTabIndex == 0
                            ? BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                              )
                            : const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                        //color: selectedTabIndex == 0 ? Colors.grey[300] : null,

                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.menu_book_rounded,
                                color: selectedTabIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Class',
                                style: TextStyle(
                                  color: selectedTabIndex == 0
                                      ? Colors.black
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => selectTab(1),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: selectedTabIndex == 1
                            ? BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                              )
                            : const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.event,
                                color: selectedTabIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Events',
                                style: TextStyle(
                                  color: selectedTabIndex == 1
                                      ? Colors.black
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => selectTab(2),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: selectedTabIndex == 2
                            ? BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                              )
                            : const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.alarm,
                                color: selectedTabIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Remind',
                                style: TextStyle(
                                  color: selectedTabIndex == 1
                                      ? Colors.black
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Display content based on selected tab and day
                if (selectedTabIndex == 0) ...[
                  // Display Class content
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text('Class Content for Day $selectedDay'),
                ] else if (selectedTabIndex == 1) ...[
                  // Display Events content
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text('Events Content for Day $selectedDay'),
                ] else if (selectedTabIndex == 2) ...[
                  // Display Events content
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      top: 3,
                                      bottom: 3,
                                      left: 2,
                                      right: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2),
                                        Text(
                                          "Add Remind",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const calendar_remind_card(),
                          ],
                        ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

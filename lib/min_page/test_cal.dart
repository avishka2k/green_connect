import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  int selectedDay = DateTime.now().day;
  ScrollController scrollController = ScrollController();
  int selectedTabIndex = 0; // 0 for Class tab, 1 for Events tab

  void changeMonth(int increment) {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + increment, selectedDate.day);
      selectedDay = DateTime(selectedDate.year, selectedDate.month, selectedDay).day;
    });
  }

  void changeDay(int day) {
    setState(() {
      int maxDays = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
      if (day < 1 || day > maxDays) {
        // Change to the next month
        int increment = day > maxDays ? 1 : -1;
        selectedDate = DateTime(selectedDate.year, selectedDate.month + increment, selectedDate.day);
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
      containers.add(
        GestureDetector(
          onTap: () => changeDay(day),
          child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedDay == day ? Colors.blue : null,
            ),
            child: Text(
              '$day',
              style: TextStyle(
                fontSize: 20,
                color: selectedDay == day ? Colors.white : null,
              ),
            ),
          ),
        ),
      );
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Month select row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => changeMonth(-1),
              ),
              Text(
                '${selectedDate.year}-${selectedDate.month}',
                style: const TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () => changeMonth(1),
              ),
            ],
          ),
          // Day select row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => changeDay(selectedDay - 1),
                ),
                ...buildDayContainers(),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () => changeDay(selectedDay + 1),
                ),
              ],
            ),
          ),
          // Class and events tab row
          
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CalendarScreen(),
  ));
}

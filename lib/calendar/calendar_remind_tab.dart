import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/calendar/calendar_remind_add.dart';
import 'package:green_connect/components/flutter_toast.dart';
import '../components/calendar_remind_card.dart';

class Module {
  final String remindID;
  final String title;
  final String note;
  final String date;
  final String time;
  final String remind;
  Module({
    required this.remindID,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    required this.remind,
  });
}

class CalendarRemindTab extends StatefulWidget {
  const CalendarRemindTab({super.key});

  @override
  State<CalendarRemindTab> createState() => _CalendarRemindTabState();
}

class _CalendarRemindTabState extends State<CalendarRemindTab> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  List<Module> remind = [];
  bool isLoading = true;
  @override
  void initState() {
    fetchModulesData();
    super.initState();
  }

  Future<void> _refreshData() async {
    await fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CalendarRemindAdd(),
                        ),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "ADD REMIND",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isLoading
                ? const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : remind.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Text("No Remind available"),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: remind.isEmpty ? 1 : remind.length,
                        itemBuilder: (context, index) {
                          if (remind.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 100),
                              child: Center(
                                child: Text("No Remind available"),
                              ),
                            );
                          } else {
                            return CalendarRemindCard(
                              itemId: remind[index].remindID,
                              title: remind[index].title,
                              note: remind[index].note,
                              date: remind[index].date,
                              time: remind[index].time,
                              remind: remind[index].remind,
                            );
                          }
                        },
                      ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection = await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("remind")
          .get();

      List<Module> remindItem = remindCollection.docs.map((doc) {
        return Module(
          remindID: doc.id,
          title: doc.get("title"),
          note: doc.get("note"),
          date: doc.get("date"),
          time: doc.get("time"),
          remind: doc.get("remind"),
        );
      }).toList();

      // Add the modules data for the current academic ID to the overall modules list
      remind.addAll(remindItem);

      // Update the widget state to reflect the changes
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
    }
  }
}

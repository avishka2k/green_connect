import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/app_menu_item.dart';
import 'package:green_connect/side_menu/payments/payments_main.dart';
import 'package:green_connect/side_menu/settings/settings_main.dart';
import '../components/flutter_toast.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  String currentUserName = 'loading...';

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    fetchUserData(user!);
  }

  Future<void> fetchUserData(User user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          currentUserName = userData['name'];
        });
      } else {
        AppToastmsg.appToastMeassage('User data not found in Firestore');
      }
    } catch (e) {
      AppToastmsg.appToastMeassage('Failed to fetch user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String capitalizedName =
        currentUserName.split(' ').map((word) => word.capitalize()).join(' ');

    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(capitalizedName),
            accountEmail: Text(user!.email.toString()),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'assets/icons/card.png',
                ),
              ),
            ),
          ),
          AppMenuItem(
            icon: "exam",
            title: "Exam",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsMain(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "card",
            title: "Payments",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PaymentsMain(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "enq",
            title: "Enquiry Center",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsMain(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "help",
            title: "Help",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsMain(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "settings",
            title: "Settings",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsMain(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "out",
            title: "Log Out",
            onTap: signOut,
          )
        ],
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

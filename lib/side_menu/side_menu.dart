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

  Future<Map<String, dynamic>?> fetchUserData(User user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        return userData.data();
      } else {
        AppToastmsg.appToastMeassage('User data not found in Firestore');
        return null;
      }
    } catch (e) {
      AppToastmsg.appToastMeassage('Failed to fetch user data: $e');

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("username"),
            accountEmail: const Text("avishka@gmail.com"),
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

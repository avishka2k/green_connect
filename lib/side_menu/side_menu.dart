import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/components/app_menu_item.dart';
import 'package:green_connect/payment/SID_enquiry_center.dart';
import 'package:green_connect/side_menu/payments/payments_main.dart';
import 'package:green_connect/side_menu/settings/settings_main.dart';
import 'package:green_connect/side_menu/transaction/transaction_main.dart';
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
  String imageUrl = '';

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
          imageUrl = userData['imageUrl'];
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

    String capitalizedName = currentUserName
        .split(' ')
        .map((word) => word.capitalizeword())
        .join(' ');

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
              child: imageUrl.isEmpty
                  ? Container()
                  : ClipOval(
                      child: Image.network(
                        imageUrl,
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
                  builder: (context) => const PaymentOptions(),
                ),
              );
            },
          ),
          AppMenuItem(
            icon: "card",
            title: "Transaction",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TransactionMain(),
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
                  builder: (context) => const SIDEnquiryCenter(),
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
  String capitalizeword() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

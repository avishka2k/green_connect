import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:green_connect/components/app_bar_with_menu.dart';
import 'package:green_connect/components/app_menu_item.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/profile/profile_main.dart';
import 'package:green_connect/side_menu/payments/payments_main.dart';
import 'package:green_connect/side_menu/settings/settings_main.dart';
import 'app_color.dart';
import 'calendar/calendar_main.dart';
import 'package:flutter/material.dart';

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
    CalendarMain(),
    Text(
      'Search',
      style: optionStyle,
    ),
    ProfileMain()
  ];

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
    return Scaffold(
      appBar: const AppBarWithMenu(
        title: "Add Remind",
        notifications: 4,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder<Map<String, dynamic>?>(
                future: fetchUserData(user!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final userData = snapshot.data;
                    String username = userData!['username'] ?? 'No username';

                    return UserAccountsDrawerHeader(
                      accountName: Text(username),
                      accountEmail: const Text("avishka@gmail.com"),
                      currentAccountPicture: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'https://xsgames.co/randomusers/assets/avatars/male/77.jpg',
                            // loadingBuilder: (context, child, loadingProgress) {
                            //   if (loadingProgress == null) return child;
                            //   return CircularProgressIndicator(
                            //     value: loadingProgress.expectedTotalBytes !=
                            //             null
                            //         ? loadingProgress.cumulativeBytesLoaded /
                            //             (loadingProgress.expectedTotalBytes ??
                            //                 1)
                            //         : null,
                            //   );
                            // },
                            // errorBuilder: (context, error, stackTrace) {
                            //   return const CircularProgressIndicator();
                            // },
                          ),
                        ),
                      ),
                    );
                  }
                }),
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
              icon: "out",
              title: "Log Out",
              onTap: signOut,
            )
          ],
        ),
      ),
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

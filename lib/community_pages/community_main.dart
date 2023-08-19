import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_connect/community_pages/community_page.dart';

class CommunityMain extends StatefulWidget {
  const CommunityMain({Key? key}) : super(key: key);

  @override
  State<CommunityMain> createState() => _CommunityMainState();
}

int notificationCount = 5;

class _CommunityMainState extends State<CommunityMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  'assets/images/propic.png',
                ),
              ),
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Text(
              'Foss',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF18A689),
              ),
            ),
            const Spacer(),
            const SizedBox(width: 8),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_rounded),
                  color: const Color(0xFF18A689),
                  onPressed: () {
                    // Handle the right icon's onPressed event here
                  },
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 392.5,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/Coverfoss.jpg', // Replace with the path to your cover image asset
                            height: 200,
                            width: 392.5,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {
                                // Handle the first button click here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff18A689),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(100,
                                    40), // Set the desired height and width
                              ),
                              child: const Text(
                                'Follow',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 130),
                            ElevatedButton(
                              onPressed: () {
                                // Handle the second button click here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff18A689),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: const Size(150,
                                    40), // Set the desired height and width
                              ),
                              child: const Text(
                                'Become a Member',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 432,
                  width: 392.5,

                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  // borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foss Comunity ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Google Events is a service offered by Google that allows users to create, manage, and share events online. It provides a platform for organizing various types of events, such as meetings, conferences, webinars, parties, and more. Users can create event invitations, set event details like date, time, and location, and send out invites to guests. Attendees can RSVP, view event details, and receive reminders. Google Events integrates with other Google services like Google Calendar, Gmail, and Google Meet, making it easy to schedule and join virtual meetings or video conferences. It provides a convenient and efficient way to plan and coordinate events, whether for personal, professional, or social purposes.',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CommunityPage(),
                            ),
                          ); // Handle the second button click here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff18A689),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(
                              150, 40), // Set the desired height and width
                        ),
                        child: const Text(
                          'More',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//

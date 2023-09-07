import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_connect/community_pages/community_page.dart';
import 'package:green_connect/app_color.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      'https://xsgames.co/randomusers/assets/avatars/male/77.jpg',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                  Padding(
                    padding: appPagePadding,
                    child: Column(
                      children: [
                        // const Row(
                        //   children: [
                        //     Column(
                        //       children: [
                        //         Image(
                        //           image: AssetImage('assets/icons/calendar.png'),
                        //           width: 25,
                        //           height: 25,
                        //         ),
                        //         Text('data')
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                        Center(
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
                                'Google Events is a service offered by Google that allows users to create, manage, and share events online. It provides a platform for organizing various types of events, such as meetings, conferences, webinars, parties, and more. Users can create event invitations, set event details like date, time, and location, and send out invites to guests. Attendees can RSVP, view event details, and receive reminders. Google Events integrates with other Google services like Google Calendar, Gmail, and Google Meet, making it easy to schedule and join virtual meetings or video conferences. It provides a convenient and efficient way to plan and coordinate events, whether for personal, professional, or social purposes.',
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
                                      builder: (context) =>
                                          const CommunityPage(),
                                    ),
                                  ); // Handle the second button click here
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
                                  'More',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//

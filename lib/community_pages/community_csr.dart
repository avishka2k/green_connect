import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class csr extends StatefulWidget {
  const csr({Key? key}) : super(key: key);

  @override
  State<csr> createState() => _csrState();
}

int notificationCount = 5;

class _csrState extends State<csr> {


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
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(
                      'assets/images/propic.png'), // Replace with the path to your profile picture asset
                ),
              ),
              Spacer(),
              SizedBox(width: 8),
              Text(
                'Haritha Saviya',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF18A689),
                ),
              ),
              Spacer(),
              SizedBox(width: 8),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications_rounded),
                    color: Color(0xFF18A689),
                    onPressed: () {
                      // Handle the right icon's onPressed event here
                    },
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: TextStyle(
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
                child: Column(children: [
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
                                      'assets/images/csr.png', // Replace with the path to your cover image asset
                                      height: 230,
                                      width: 392.5,
                                      fit: BoxFit.cover,
                                    ),

                                  ]),                      //SizedBox(width: 10),



                            ],

                          ))),

                  Center(
                      child: Container(
                        height: 432,
                        width: 392.5,

                        decoration: BoxDecoration(
                          color: Colors.white,),
                        // borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Text(
                                'Haritha Saviya',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                ' We are excited to inform you about our upcoming Corporate Social Responsibility (CSR) project called "Haritha Saviya." This initiative aims to support O/L students from rural villages in the Ampara district by organizing a seminar and providing them with essential stationery suppliesWe are reaching out to you, our esteemed university students, for your valuable support. We kindly request your sponsorship or financial contribution towards this project. Your generosity will play a significant role in empowering these students and enhancing their educational opportunities.Project Name: “Haritha Saviya”Objective: Supporting O/L students from rural villages in Ampara through a seminar and stationery supplies.Date: 13/10/2023Location: Uksiripura vidyalaya.Your sponsorship or donation will contribute to the success of this project and will be recognized during the seminar and in our project reports.',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10,),
                              ElevatedButton(

                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => communitypage()),
                                  );// Handle the second button click here
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff18A689),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  minimumSize: Size(150, 40), // Set the desired height and width
                                ),
                                child: Text(
                                  'Donate',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )]),


                      )),


                ]))));
  }
}
//

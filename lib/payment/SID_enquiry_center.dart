import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  get _textEditingController => null;

  final _value="-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SID Enquiry Center",
        style: TextStyle(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,

        ) ,
      ),

        elevation: 1.0,
        backgroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 15),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'SID Details                             ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),


            // Enter your name ________________________________

            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Your name'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),


            // Enter batch _____________________

            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'Batch'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),


            // Select faculty _____________________________

            const SizedBox(height: 15),
            Padding(
              padding:const EdgeInsets.all(0),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                ),
                value: _value,
                items: const [
                  DropdownMenuItem(
                    value: "-1",
                    child: Text("Faculty"),
                  ),
                  DropdownMenuItem(
                    value: "1",
                    child: Text("Faculty of Computing"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("Faculty of Bussiness"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("Faculty of Engineering"),
                  ),
                ], onChanged: (v) {  },
              ),
            ),


            // Enter Amount __________________

            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 450,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'LKR'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                ),


                //Radio buttons ______________________________

                const SizedBox(height: 10),
                Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Radio(
                                  value: 1, groupValue: 'null', onChanged: (index) {}),
                              const Expanded(
                                child: Text(
                                  'Lost ID',
                                  maxLines: 2,
                                  style: TextStyle(fontSize:18, ),
                                ),),
                            ],
                          ),
                        ),

                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Radio(
                                  value: 1, groupValue: 'null', onChanged: (index) {}),
                              const Expanded(
                                child: Text(
                                  'Damaged ID',
                                  maxLines: 2,
                                  style: TextStyle(fontSize:18, ),
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Radio(
                                  value: 1, groupValue: 'null', onChanged: (index) {}),
                              const Expanded(
                                child: Text(
                                  'Security Concerns',
                                  maxLines: 2,
                                  style: TextStyle(fontSize:18, ),
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),


                // Text ______________________

                const SizedBox(height: 10),
                const Align(
                  child: Text(
                    'Note: This details will directly send to the university IT department, They will contact you.                             ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
                ),

                // Pay now button _____________________

                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
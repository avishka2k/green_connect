import 'package:flutter/cupertino.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  get _textEditingController => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Top-Up",
        style: TextStyle(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,

        ) ,
      ),

        elevation: 5.0,
        backgroundColor: Colors.white,

      ),
      body: Container(

        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  'Student ID Top-UP                ',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),


              const SizedBox(height: 20),
              const Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  'This allows you to provide the following benefits.',
                  style: const TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),



              // Divider(
              //   color: Colors.black45,
              //   thickness: 1,
              //   indent: 5,
              //   endIndent: 5,
              // ),

              const SizedBox(height: 5),
              const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Text(
                  ' You can pay for the gym',
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),

              ),
              // Icon(Icons.check, color: Colors.green, size: 20,),

              const SizedBox(height: 5),
              const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Text(
                  ' You can pay for the pool',
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              const SizedBox(height: 5),
              const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Text(
                  ' You can buy event ticket',
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              const SizedBox(height: 5),
              const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: Text(
                  '  You can pay for library fee',
                  style: const TextStyle(
                    fontSize: 15,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 18),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'Amount : ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),


              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 370,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Amount'),
                        controller: _textEditingController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,

                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),


                ],
              ),

              const SizedBox(height: 18),
              const Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  'Currency : ',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 370,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'LKR'),
                        controller: _textEditingController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,

                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),


                  const SizedBox(height: 15),
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
      ),

    );
  }
}


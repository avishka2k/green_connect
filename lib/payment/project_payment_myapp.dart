import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

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
      appBar: AppBar(title: Text("Payments",
        style: TextStyle(
          color: Colors.green[800],
          fontWeight: FontWeight.bold,

        ) ,
      ),
        // flexibleSpace:Image.asset("assests/images(2).jpeg",
        //   fit: BoxFit.cover,
        // ),

        elevation: 1.0,
        backgroundColor: Colors.white,

      ),
      body: Container(

        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'Details                             ',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),


              // Enter name ----------------------------------------------------

              const SizedBox(height: 15),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  "Project Name : ",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),


              const SizedBox(height: 0),
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
                        decoration: InputDecoration(hintText: 'Haritha Saviya'),
                        controller: _textEditingController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,

                        ),
                        keyboardType: TextInputType.text,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.singleLineFormatter,
                        // ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),


                ],
              ),

              // Enter intake --------------------------------------------------

              const SizedBox(height: 10),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'Faculty :',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),



              const SizedBox(height: 0),
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
                        decoration: InputDecoration(hintText: 'Faculty of Computing'),
                        controller: _textEditingController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,

                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.singleLineFormatter,
                        // ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 35),
              Divider(
                color: Colors.black87,
                thickness: 1,
                indent: 2,
                endIndent: 2,
              ),

              // Enter amount -------------------------------------------------

              const SizedBox(height: 30),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'Amount :',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),


              const SizedBox(height: 0),
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
                        decoration: InputDecoration(hintText: 'LKR'),
                        controller: _textEditingController,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,

                        ),
                        keyboardType: TextInputType.number,
                        // inputFormatters: <TextInputFormatter>[
                        //   FilteringTextInputFormatter.singleLineFormatter,
                        // ],
                        onChanged: (value) {},
                      ),
                    ),
                  ),

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
      ),

    );

    // TabBarView(
    //   children: [
    //     tab1(),
    //     Icon(Icons.directions_transit),
    //     Icon(Icons.directions_bike),
    //   ],
    // ),



  }
}
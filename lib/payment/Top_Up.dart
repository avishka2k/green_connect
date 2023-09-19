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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Align(
              alignment: FractionalOffset(0, 1),
              child: Text(
                'Student ID Top-UP                ',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),


            // Text ..............

            const SizedBox(height: 20),
            const Align(
              alignment: FractionalOffset(0, 1),
              child: Text(
                'This allows you to provide the following benefits.',
                style: TextStyle(
                  fontSize:18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),


            const SizedBox(height: 5),
            const Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: Text(
                ' You can pay for the gym',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),


            const SizedBox(height: 5),
            const Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: Text(
                ' You can pay for the pool',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),


            const SizedBox(height: 5),
            const Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: Text(
                ' You can buy event ticket',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),


            const SizedBox(height: 5),
            const Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: Text(
                '  You can pay for library fee',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            // Enter amount...........................

            const SizedBox(height: 18),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'Amount : ',
                style: TextStyle(
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
                      decoration: const InputDecoration(hintText: 'Amount'),
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

            // Enter currency ......................

            const SizedBox(height: 18),
            const Align(
              alignment: FractionalOffset(0, 1),
              child: Text(
                'Currency : ',
                style: TextStyle(
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
                      decoration: const InputDecoration(hintText: 'LKR'),
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


                // Pay now button ...................................

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
    );
  }
}


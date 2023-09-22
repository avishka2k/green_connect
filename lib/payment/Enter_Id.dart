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
      appBar: AppBar(
        title: Text(
          "Payments",
          style: TextStyle(
            color: Colors.green[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Align(
              alignment: FractionalOffset(0, 1),
              child: Text(
                'Pay online',
                textAlign: TextAlign.start,
                style: TextStyle(
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
                'Online payments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),

            const Divider(
              color: Colors.black45,
              thickness: 1,
              indent: 2,
              endIndent: 2,
            ),

            const SizedBox(height: 10),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                ' Enter your student ID and verify details.',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ),

            // Enter ID ...............................

            const SizedBox(height: 45),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                "Student's NSBM ID no/Reference no: ",
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
                      decoration:
                          const InputDecoration(hintText: 'Enter Student ID'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),

            // Search button .............................

            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(450, 50),
                  ),
                  child: const Text(
                    'SEARCH',
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

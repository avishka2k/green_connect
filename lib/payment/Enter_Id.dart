import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatelessWidget {
  get _textEditingController => null;

  List<String> items = [
    '',
    'Degree fee',
    'Bridging Programme fee',
    'Hostel fee'
  ];
  String? selectedItem = '';

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
        // flexibleSpace:Image.asset("assests/images(2).jpeg",
        //   fit: BoxFit.cover,
        // ),

        elevation: 1.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'Details                             ',
                textAlign: TextAlign.start,
                style: TextStyle(
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
                "Student Name : ",
                textAlign: TextAlign.start,
                style: TextStyle(
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
                      decoration: const InputDecoration(hintText: 'your name'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
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
                'Intake :',
                style: TextStyle(
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
                      decoration: const InputDecoration(hintText: 'batch'),
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

            // Enter degree --------------------------------------------------

            const SizedBox(height: 10),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'Degree :',
                style: TextStyle(
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
                      decoration:
                          const InputDecoration(hintText: 'degree name'),
                      controller: _textEditingController,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),

            // Enter fee type ------------------------------------------------

            const SizedBox(height: 10),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'Fee Type :',
                style: TextStyle(
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
                SizedBox(
                  width: 400,
                  height: 58,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            const BorderSide(width: 1.5, color: Colors.green),
                      ),
                    ),
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
                  ),
                ),
              ],
            ),

            // Enter amount -------------------------------------------------

            const SizedBox(height: 10),
            const Align(
              alignment: FractionalOffset(0, 0.2),
              child: Text(
                'Amount :',
                style: TextStyle(
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

    // TabBarView(
    //   children: [
    //     tab1(),
    //     Icon(Icons.directions_transit),
    //     Icon(Icons.directions_bike),
    //   ],
    // ),
  }
}

setState(String? Function() param0) {}

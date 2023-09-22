import 'package:flutter/material.dart';
import 'package:green_connect/components/app_bar_with_back.dart';

class SIDEnquiryCenter extends StatelessWidget {
  SIDEnquiryCenter({super.key});

  get _textEditingController => null;

  final TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBack(title: "SID Enquiry Center"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'SID Details                             ',
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                controller: _aboutController,
                decoration: const InputDecoration(
                  hintText: 'Text',
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                                    value: 1,
                                    groupValue: 'null',
                                    onChanged: (index) {}),
                                const Expanded(
                                  child: Text(
                                    'Lost ID',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: 'null',
                                    onChanged: (index) {}),
                                const Expanded(
                                  child: Text(
                                    'Damaged ID',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
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
                                    value: 1,
                                    groupValue: 'null',
                                    onChanged: (index) {}),
                                const Expanded(
                                  child: Text(
                                    'Security Concerns',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
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
                      textAlign: TextAlign.left,
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
                      'Submit Now',
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

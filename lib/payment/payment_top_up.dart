import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_bar_with_back.dart';
import 'package:green_connect/components/app_text_form_field.dart';

class PaymentTopUp extends StatefulWidget {
  const PaymentTopUp({super.key});

  @override
  State<PaymentTopUp> createState() => _PaymentTopUpState();
}

class _PaymentTopUpState extends State<PaymentTopUp> {
  final TextEditingController amountController = TextEditingController();
  String? selectedItem;
  List<String> items = ['LKR', 'USD', 'NR'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBack(title: "Payments"),
      body: SingleChildScrollView(
        child: Padding(
          padding: appPagePadding,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  'Student ID Top-UP                ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: FractionalOffset(0, 1),
                child: Text(
                  'This allows you to provide the following benefits.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appBlack,
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
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fee Type",
                      style: TextStyle(
                        fontSize: 15,
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    DropdownButtonFormField<String>(
                      value: selectedItem,
                      items: items.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedItem = val;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppTextformfield(
                field_controller: amountController,
                labelText: 'Amount',
                keyboardType: TextInputType.number,
                hintText: '',
                onTap: () {},
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(0, 60),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "TopUp Now",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

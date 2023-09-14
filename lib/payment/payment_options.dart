// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_bar_with_back.dart';
import 'package:green_connect/components/app_text_form_field.dart';

class PaymentEnterId extends StatefulWidget {
  const PaymentEnterId({super.key});

  @override
  State<PaymentEnterId> createState() => _PaymentEnterIdState();
}

class _PaymentEnterIdState extends State<PaymentEnterId> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController intakeController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String? selectedItem;

  List<String> items = ['Degree fee', 'Bridging Programme fee', 'Hostel fee'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBack(title: "Payments"),
      body: SingleChildScrollView(
        child: Padding(
          padding: appPagePadding,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Align(
                alignment: FractionalOffset(0, 0.2),
                child: Text(
                  'Details                             ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AppTextformfield(
                field_controller: nameController,
                labelText: 'Students Name',
                hintText: '',
                readOnly: true,
                onTap: () {},
                //isValidate: false,
              ),
              AppTextformfield(
                field_controller: intakeController,
                labelText: 'Intake',
                hintText: '',
                readOnly: true,
                onTap: () {},
                //isValidate: false,
              ),
              AppTextformfield(
                field_controller: degreeController,
                labelText: 'Degree',
                hintText: '',
                readOnly: true,
                onTap: () {},
                //isValidate: false,
              ),
              AppTextformfield(
                field_controller: intakeController,
                labelText: 'Intake',
                hintText: '',
                readOnly: true,
                onTap: () {},
                //isValidate: false,
              ),
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
                hintText: '',
                onTap: () {},
                //isValidate: false,
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
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   addModuleData();
                        // }
                      },
                      child: const Text(
                        "Pay Now",
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

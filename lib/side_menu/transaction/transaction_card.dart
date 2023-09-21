// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionCard extends StatefulWidget {
  final String transactionId;
  final String? receiptId;
  final double? amount;
  final String? payment_date;
  final String? fee_type;
  const TransactionCard({
    super.key,
    required this.transactionId,
    this.receiptId,
    this.amount,
    this.payment_date,
    this.fee_type,
  });

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  final firestoreInstance = FirebaseFirestore.instance;

  final User? user = FirebaseAuth.instance.currentUser;

  void deleteModule(String transactionId) async {
    try {
      await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("remind")
          .doc(transactionId)
          .delete();

      // Update the widget state to reflect the changes
      setState(() {});
    } catch (e) {
      AppToastmsg.appToastMeassage('Error deleting module: $e');
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context, String itemId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0), // Adjust the radius here
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                deleteModule(itemId);
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            _showDeleteConfirmationDialog(context, widget.transactionId);
          },
          child: Container(
            width: double.infinity,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  //spreadRadius: 1,
                  blurRadius: 1,
                  blurStyle: BlurStyle.solid,
                  offset: Offset.zero,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.fee_type.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor("#00744A"),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.payment_date.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.receiptId.toString(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 88, 88, 88),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Rs ${widget.amount.toString()}',
                      style: const TextStyle(
                        color: appBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

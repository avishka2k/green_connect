import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_connect/app_color.dart';
import 'package:green_connect/components/app_bar_with_back.dart';
import 'package:green_connect/components/flutter_toast.dart';
import 'package:green_connect/side_menu/transaction/transaction_card.dart';
import 'package:intl/intl.dart';

class Module {
  final String transactionId;
  final String receiptId;
  final double amount;
  final DateTime payment_date;
  final String fee_type;
  Module({
    required this.transactionId,
    required this.receiptId,
    required this.amount,
    required this.payment_date,
    required this.fee_type,
  });
}

class TransactionMain extends StatefulWidget {
  const TransactionMain({super.key});

  @override
  State<TransactionMain> createState() => _TransactionMainState();
}

class _TransactionMainState extends State<TransactionMain> {
  final firestoreInstance = FirebaseFirestore.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  List<Module> payments = [];
  bool isLoading = true;

  @override
  void initState() {
    fetchModulesData();
    super.initState();
  }

  Future<void> fetchModulesData() async {
    try {
      final remindCollection = await firestoreInstance
          .collection("users")
          .doc(user!.uid)
          .collection("payments")
          .orderBy('payment_date')
          .get();

      List<Module> paymentsItem = remindCollection.docs.map((doc) {
        return Module(
          transactionId: doc.id,
          receiptId: doc.get("receiptId"),
          amount: doc.get("amount"),
          payment_date: doc.get("payment_date").toDate(),
          fee_type: doc.get("fee_type"),
        );
      }).toList();

      payments.addAll(paymentsItem);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AppToastmsg.appToastMeassage('Error fetching modules data!');
    }
  }

  Future<void> _refreshData() async {
    await fetchModulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithBack(
        title: "Transaction",
        notifications: 4,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: appPagePadding,
            child: ListView.builder(
              shrinkWrap: true,
             // physics: const NeverScrollableScrollPhysics(),
              itemCount: payments.length,
              itemBuilder: (BuildContext context, int index) {
                String paymentDate = DateFormat('E, MMM d, y')
                    .format(payments[index].payment_date);
                return isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : payments.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 100),
                            child: Center(
                              child: Text("No Transaction available"),
                            ),
                          )
                        : TransactionCard(
                            transactionId: payments[index].transactionId,
                            receiptId: payments[index].receiptId,
                            amount: payments[index].amount,
                            payment_date: paymentDate,
                            fee_type: payments[index].fee_type,
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}

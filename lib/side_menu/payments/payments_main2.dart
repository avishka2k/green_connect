import 'package:flutter/material.dart';

import '../../components/app_bar_with_back.dart';

class PaymentsMain extends StatelessWidget {
  const PaymentsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWithBack(title: "Payments"),
      body: Center(
        child: Text("Payments"),
      ),
    );
  }
}

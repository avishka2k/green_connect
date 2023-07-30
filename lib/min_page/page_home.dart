//import '../components/top_bar.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
         // TopBar(title: "Home"),
          Center(child: Text("home")),
        ],
      ),
    );
  }
}

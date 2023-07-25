import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  String title;
  TopBar({super.key, required this.title});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            "https://picsum.photos/200",
            width: 40,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container(
                width: 40,
                height: 40,
                color: Colors.grey.shade400,
              );
            },
          ),
        ),
        const Spacer(),
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Stack(
          children: [
            Icon(
              Icons.notifications,
              size: 30,
              color: Theme.of(context).primaryColor,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "2",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

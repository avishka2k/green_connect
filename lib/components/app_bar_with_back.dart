import 'package:flutter/material.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int? notifications;

  AppBarWithBack({required this.title, this.notifications});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ),
      actions: [
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
                child: Text(
                  notifications != null ? notifications.toString() : "0",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}

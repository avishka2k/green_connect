import 'package:flutter/material.dart';

class AppMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const AppMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  //Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image(
        image: AssetImage('assets/icons/$icon.png'),
        width: 25,
        height: 25,
      ),
      title: Text(title),
    );
  }
}

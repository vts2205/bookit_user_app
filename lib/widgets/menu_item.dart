import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final double size;
  final VoidCallback onTap;
  const MenuItems(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.color,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 35,
      ),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: size),
      ),
      onTap: onTap,
    );
  }
}

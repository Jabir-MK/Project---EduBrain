import 'package:flutter/material.dart';

class DrawerListItems extends StatelessWidget {
  const DrawerListItems({
    super.key,
    required this.listTitle,
    required this.listIcon,
    required this.listOnTap,
    required this.iconColor,
  });

  final String listTitle;
  final IconData listIcon;
  final void Function() listOnTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        listIcon,
        color: iconColor,
      ),
      title: Text(
        listTitle,
        style: const TextStyle(
          fontFamily: 'Kalam',
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onTap: listOnTap,
    );
  }
}

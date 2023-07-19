
import 'package:flutter/material.dart';

class DropdownItem {
  final String name;

  final bool header;
  final IconData iconData;

  DropdownItem({
    required this.name,
    this.header = false,
    required this.iconData,
  });
}


List<DropdownItem> items = [
    DropdownItem(
      name: 'CATEGORY',
      iconData: Icons.category,
      header: true,
    ),
    DropdownItem(
      name: 'PROJECTS',
      iconData: Icons.personal_injury_rounded,
    ),
    DropdownItem(
      name: 'MESSAGES',
      iconData: Icons.message,
    ),
    DropdownItem(
      name: 'GAME',
      iconData: Icons.gamepad,
    ),
    DropdownItem(
      name: 'SETTINGS',
      iconData: Icons.settings,
    ),
  ];

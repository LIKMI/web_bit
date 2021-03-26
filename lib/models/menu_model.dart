import 'package:flutter/material.dart';

class MenuModelClass {
  final dynamic icon;
  final String title;
  final String? routeName;
  final TextStyle? textStyle;
  final TextStyle? hoverStyle;
  final Color? hoverColor;

  const MenuModelClass({
    this.icon,
    required this.title,
    this.routeName,
    this.textStyle,
    this.hoverStyle,
    this.hoverColor,
  });
}

List<MenuModelClass> menuModel = [
  MenuModelClass(
      title: 'Recent Project',
      icon: Icons.important_devices_rounded,
      routeName: '/Recent'),
  MenuModelClass(
      title: 'Contribute',
      icon: Icons.group_add_rounded,
      routeName: '/Contribute'),
  MenuModelClass(title: 'Internship', icon: Icons.badge, routeName: '/Intern'),
];

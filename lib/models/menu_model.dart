import 'package:flutter/material.dart';

class MenuModelClass {
  final dynamic icon;
  final String title;
  final String routeName;

  const MenuModelClass({
    this.icon,
    required this.title,
    required this.routeName,
  });
}

List<MenuModelClass> menuModel = [
  MenuModelClass(
      title: 'Home',
      icon: Icons.home,
      routeName: '/'),
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

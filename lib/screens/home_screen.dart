// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texter/pages/calls_page.dart';
import 'package:texter/pages/contacts_page.dart';
import 'package:texter/pages/messages_page.dart';
import 'package:texter/pages/notifications_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarItem(
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            label: 'messages',
          ),
          NavigationBarItem(
            icon: CupertinoIcons.bell_solid,
            label: 'notifications',
          ),
          NavigationBarItem(
            icon: CupertinoIcons.phone_fill,
            label: 'calls',
          ),
          NavigationBarItem(
            icon: CupertinoIcons.person_2_fill,
            label: 'contacts',
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({Key? key, required this.label, required this.icon})
      : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}

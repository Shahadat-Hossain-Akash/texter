// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texter/pages/calls_page.dart';
import 'package:texter/pages/contacts_page.dart';
import 'package:texter/pages/messages_page.dart';
import 'package:texter/pages/notifications_page.dart';
import 'package:texter/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");

  final pages = const [
    MessagesPage(),
    NotificationsPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitle = const [
    "Messages",
    "Notifications",
    "Calls",
    "Contacts",
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitle[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              title.value,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: AppColors.cardLight),
            );
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onItemSelected: _onNavigationItemSelected,
      ),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  const BottomNavigationBar({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationBarItem(
            index: 0,
            icon: CupertinoIcons.bubble_left_bubble_right_fill,
            label: 'messages',
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 0),
          ),
          NavigationBarItem(
            index: 1,
            icon: CupertinoIcons.bell_solid,
            label: 'notifications',
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 1),
          ),
          NavigationBarItem(
            index: 2,
            icon: CupertinoIcons.phone_fill,
            label: 'calls',
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 2),
          ),
          NavigationBarItem(
            index: 3,
            icon: CupertinoIcons.person_2_fill,
            label: 'contacts',
            onTap: handleItemSelected,
            isSelected: (selectedIndex == 3),
          ),
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final int index;
  final bool isSelected;

  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.cardLight : AppColors.textFaded,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected
                  ? TextStyle(
                      fontSize: 11,
                      color: AppColors.cardLight,
                      fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 11, color: AppColors.textFaded),
            ),
          ],
        ),
      ),
    );
  }
}

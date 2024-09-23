import 'package:flutter/material.dart';
import 'package:whatsapp/common/extension/custom_theme_extension.dart';
import 'package:whatsapp/features/home/pages/call_home_page.dart';
import 'package:whatsapp/features/home/pages/chat_home_page.dart';
import 'package:whatsapp/features/home/pages/communities_home_page.dart';
import 'package:whatsapp/features/home/pages/setting_home_page.dart';

import 'package:whatsapp/features/home/pages/update_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> screens = [
    const UpdateHomePage(),
    const CallHomePage(),
    const CommunitiesHomePage(),
    const ChatHomePage(),
    const SettingHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/status.png',
              width: 24,
              height: 24,
            ),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calls.png',
              width: 24,
              height: 24,
            ),
            label: 'Calls',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_sharp),
            label: 'Communities',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/chats.png',
              width: 24,
              height: 24,
            ),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/settings.png',
              width: 24,
              height: 24,
            ),
            label: 'Settings',
          ),
        ],
        selectedItemColor: context.theme.authAppbarTextColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

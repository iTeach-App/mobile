import 'package:flutter/material.dart';
import 'package:iteach/views/general_chat.dart';
import 'package:iteach/views/lectures.dart';
import 'package:iteach/views/profile_page.dart';
import 'package:iteach/views/general_map.dart';

class BottomBarTutorPage extends StatefulWidget {
  const BottomBarTutorPage({Key? key}) : super(key: key);

  @override
  _BottomBarTutorPageState createState() => _BottomBarTutorPageState();
}

class _BottomBarTutorPageState extends State<BottomBarTutorPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const LecturesPage(),
    const GeneralChatPage(),
    const GeneralMapPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lezioni',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Mappa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo',
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue, // Set the selected item color to blue
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

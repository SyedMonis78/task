import 'package:flutter/material.dart';

import 'account.dart';
import 'home.dart';
import 'music.dart';
import 'search.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> with SingleTickerProviderStateMixin{

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Search(),
    // Music(),
    // Account()
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        color: Color(0xFF311B92).withOpacity(0.6),
        child: BottomNavigationBar(
          elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            mouseCursor: SystemMouseCursors.click,
            backgroundColor: Color(0xFF311B92).withOpacity(0.3),
            selectedItemColor:Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: onTappedBar,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon:Icon(Icons.home),label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),label: ''),
              // BottomNavigationBarItem(
              //     icon:  Icon(Icons.music_note),label: ''),
              // BottomNavigationBarItem(
              //     icon:  Icon(Icons.account_circle),label: ''),
            ]),

      ),
    ));
  }
}

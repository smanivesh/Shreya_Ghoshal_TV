import 'package:flutter/material.dart';
//import 'package:tiktok_clone/screens/home_page.dart';
import 'package:tiktok_clone/screens/home_pageTry.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tiktok_clone/screens/new_home_screen.dart';
//import 'package:tiktok_clone/screens/home_page_try.dart';
import 'package:tiktok_clone/screens/profile.dart';
import 'package:tiktok_clone/screens/search_screen.dart';

// class Nav extends StatefulWidget {
//   @override
//   _NavState createState() => _NavState();
// }

// class _NavState extends State<Nav> {
//   int _selectedIndex = 0;
//   List<Widget> _widgetOptions = <Widget>[
//     HomePageTry(),
//     // HomePage(),
//     SearchScreen(),
//     // Text('Search'),
//     Profile(),
//     // Text('Profile'),
//   ];

//   void _onItemTap(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.transparent.withOpacity(1),
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'IGTV'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTap,
//       ),
//     );
//   }
// }

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  List<Widget> _widgetOptions = <Widget>[
    //HomePageTry(),
    NewHome(),
    SearchScreen(),
    Profile(),
  ];
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.tv,
              size: 25,
              color: Colors.black,
            ),
            Icon(
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
            Icon(
              Icons.perm_identity,
              size: 25,
              color: Colors.black,
            ),
          ],
          color: Colors.white,
          backgroundColor: Colors.transparent.withOpacity(0.5),
          buttonBackgroundColor: Colors.white,
          // backgroundColor: Colors.brown,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          child: _widgetOptions.elementAt(_page),
        ));
  }
}

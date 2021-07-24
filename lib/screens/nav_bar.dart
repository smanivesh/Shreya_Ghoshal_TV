import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tiktok_clone/screens/new_home_screen.dart';
import 'package:tiktok_clone/screens/profile.dart';
import 'package:tiktok_clone/screens/search_screen.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  // final _pageViewController = PageController();

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
              Icons.live_tv_rounded,
              size: 25,
              color: Colors.black,
            ),
            Icon(
              Icons.campaign,
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

          backgroundColor: Colors.black,
          // backgroundColor: Colors.transparent.withOpacity(0.5),
          buttonBackgroundColor: Colors.white,
          // backgroundColor: Colors.brown,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            // _pageViewController.animateToPage(index,
            //     duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
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

//import 'dart:ffi';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://wa.me/918979571089 ';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/concert.jpg'),
          image: AssetImage("assets/images/sg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: () {
                    Share.share(
                        'check out my game app https://play.google.com/store/apps/details?id=com.khopdi.flipout',
                        subject: 'Look what I made!');
                  },
                  text: "   Share more with fans",
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  buttonBoxShadow: true,
                  icon: Icon(Icons.share_rounded),

                  shape: GFButtonShape.pills,
                  color: Colors.yellow[200],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.deepPurpleAccent,
                  //fullWidthButton: true,
                  blockButton: true,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: () {},
                  text: "⭐⭐⭐⭐⭐   Rate us",
                  textStyle: TextStyle(fontSize: 20, color: Colors.yellow),

                  // icon: Icon(Icons.star_purple500_outlined),
                  shape: GFButtonShape.pills,
                  color: Colors.brown[900],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.pinkAccent,
                  // fullWidthButton: true,

                  blockButton: true,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: _launchURL,
                  text: "  Contact me!",
                  textStyle: TextStyle(fontSize: 20, color: Colors.green[900]),
                  icon: ImageIcon(AssetImage("assets/images/whatsapp.png")),
                  shape: GFButtonShape.pills,
                  color: Colors.yellow[100],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.yellow[100],
                  //fullWidthButton: true,
                  blockButton: true,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

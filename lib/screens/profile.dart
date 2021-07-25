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
          image: AssetImage("assets/images/music.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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
                  text: " Share with more fans",
                  textStyle: TextStyle(fontSize: 20, color: Colors.white),
                  buttonBoxShadow: true,
                  icon: Icon(Icons.share_rounded),

                  shape: GFButtonShape.pills,
                  color: Colors.deepOrange[400],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.purple,
                  //fullWidthButton: true,
                  blockButton: true,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: _launchURL,
                  text: "  Contact Me!",
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  // icon: ImageIcon(AssetImage("assets/images/whatsapp.png")),
                  icon: Icon(Icons.message),
                  shape: GFButtonShape.pills,
                  color: Colors.pink[800],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.lightBlue,
                  //fullWidthButton: true,

                  blockButton: true,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: () {},
                  text: "⭐⭐⭐⭐⭐   Rate Us",
                  textStyle: TextStyle(fontSize: 20, color: Colors.yellow),

                  // icon: Icon(Icons.star_purple500_outlined),
                  shape: GFButtonShape.pills,
                  color: Colors.green[900],
                  size: 50,
                  autofocus: true,
                  splashColor: Colors.teal,
                  // fullWidthButton: true,

                  blockButton: true,
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    ));
  }
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

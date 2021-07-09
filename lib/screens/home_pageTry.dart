import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:tiktok_clone/screens/content_screen.dart';
import 'package:tiktok_clone/screens/play_screen.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://wa.me/918979571089 ';
const _url1 = 'https://youtu.be/L20ugYvBo7I';

// ignore: must_be_immutable
class HomePageTry extends StatefulWidget {
  @override
  _HomePageTryState createState() => _HomePageTryState();
}

class _HomePageTryState extends State<HomePageTry> {
  final List<String> videos = [
    'https://youtu.be/L20ugYvBo7I',
    'https://youtu.be/d95PPykB2vE',
    'https://youtu.be/cwjMwmDSKV0',
    'https://youtu.be/hFB_Cp7oFDY',
    'https://youtu.be/lTTajzrSkCw',
    'https://youtu.be/JzPfMbG1vrE',
    'https://youtu.be/QbhS-p0uWNc',
    'https://youtu.be/MfG8ZdBT4f8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              new Swiper(
                duration: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return new Swiper(
                    duration: 2,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return PlayScreen(
                        src: videos[index],
                      );
                    },
                    itemCount: videos.length,
                  );
                },
                itemCount: videos.length,
              ),
              // Padding(
              //  padding: const EdgeInsets.all(8.0),
              //  child:

              // Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       Center(
              //         child: Container(
              //           child: Row(
              //             children: [Text('🛰️The Internet')],
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          color: Colors.white,
                          iconSize: 25,
                          onPressed: () => {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Colors.blueGrey,
                                    // height: 300,
                                    child: Container(
                                      child: column(),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).canvasColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(10),
                                            topRight: const Radius.circular(10),
                                          )),
                                    ),
                                  );
                                })
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.screen_lock_rotation),
                          color: Colors.white,
                          iconSize: 25,
                          onPressed: () {
                            if (MediaQuery.of(context).orientation ==
                                Orientation.landscape) {
                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.portraitUp]);
                            } else {
                              SystemChrome.setPreferredOrientations(
                                  [DeviceOrientation.landscapeLeft]);
                            }
                          },
                        ),
                        Text(
                          '🛰️The Internet',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Column(
              //   //mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Row(
              //       // crossAxisAlignment: CrossAxisAlignment.center,
              //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         TextButton(
              //           child: Icon(Icons.more_vert),
              //           style: ButtonStyle(
              //             foregroundColor:
              //                 MaterialStateProperty.all<Color>(Colors.white),
              //           ),
              //           onPressed: () => {
              //             showModalBottomSheet(
              //                 context: context,
              //                 builder: (context) {
              //                   return Container(
              //                     color: Colors.blueGrey,
              //                     // height: 300,
              //                     child: Container(
              //                       child: column(),
              //                       decoration: BoxDecoration(
              //                           color: Theme.of(context).canvasColor,
              //                           borderRadius: BorderRadius.only(
              //                             topLeft: const Radius.circular(10),
              //                             topRight: const Radius.circular(10),
              //                           )),
              //                     ),
              //                   );
              //                 })
              //           },
              //         ),
              //         TextButton(
              //           child: Icon(Icons.screen_rotation),
              //           style: ButtonStyle(
              //             foregroundColor:
              //                 MaterialStateProperty.all<Color>(Colors.white),
              //           ),
              //           onPressed: () {
              //             if (MediaQuery.of(context).orientation ==
              //                 Orientation.landscape) {
              //               SystemChrome.setPreferredOrientations(
              //                   [DeviceOrientation.portraitUp]);
              //             } else {
              //               SystemChrome.setPreferredOrientations(
              //                   [DeviceOrientation.landscapeLeft]);
              //             }
              //           },
              //         ),
              //         Center(
              //           child: Text(
              //             '🛰️The Internet',
              //             style: TextStyle(
              //               fontSize: 22,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ),
              //         TextButton(
              //             child: Icon(Icons.star_border_outlined),
              //             style: ButtonStyle(
              //               foregroundColor:
              //                   MaterialStateProperty.all<Color>(Colors.white),
              //             ),
              //             onPressed: () => {}),
              //       ],
              //     ),
              Column(
                children: [
                  Center(
                    child: Text(
                      'The Internet in videos under 30 seconds',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column column() {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("short explaination about video"),
          // onTap: () => _selectItem('cooling'),
        ),
        ListTile(
          leading: Icon(Icons.thumb_up_alt_outlined),
          title: Text("Like"),
          // onTap: () => _selectItem('cooling'),
        ),
        ListTile(
          leading: Icon(Icons.share),
          title: Text("Share"),
          // onTap: () => _selectItem('cooling'),
        ),
        ListTile(
          leading: Icon(Icons.music_video_sharp),
          title: Text("Watch on youtube"),
          // onTap: () => _selectItem('cooling'),
          //    onTap: _launchURL1,
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help"),
          // onTap: () => _selectItem('cooling'),
          onTap: _launchURL,
        ),
      ],
    );
  }
}

// void _launchURL1() async => await canLaunch(_url1)
//     ? await launch(_url1)
//     : throw 'Could not launch $_url1';

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

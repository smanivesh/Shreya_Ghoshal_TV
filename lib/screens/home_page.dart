import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:tiktok_clone/screens/content_screen.dart';
import 'package:tiktok_clone/screens/play_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
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
              //We need swiper for every content

              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return PlayScreen(
                    src: videos[index],
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,

                //layout: SwiperLayout.TINDER,
                // layout: SwiperLayout.CUSTOM,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    color: Colors.blueGrey,
                                    height: 300,
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
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Icon(
                            Icons.more_vert,
                          ),
                        ),
                        ElevatedButton(
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
                          child: Icon(
                            Icons.rotate_right,
                            // Icons.threed_rotation_outlined,
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                        ),
                        Text(
                          '🛰️The Internet',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                            child: Icon(Icons.star_border_outlined),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                            ),
                            onPressed: () => {}),
                      ],
                    ),
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
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text("Help"),
          // onTap: () => _selectItem('cooling'),
        ),
      ],
    );
  }
}

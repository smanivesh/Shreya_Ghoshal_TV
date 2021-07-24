//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/options_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreen extends StatefulWidget {
  final String src;
  final Function onEnd;
  const PlayScreen({Key key, this.src, this.url, this.onEnd}) : super(key: key);
  //PlayScreen({this.url});
  final url;

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.src),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: true,
          disableDragSeek: true,
          hideControls: false,
          // loop: true,
          loop: false,
          endAt: 0,
        ));
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        YoutubePlayer(
          controller: _controller,
          bottomActions: [
            // PlayPauseButton(),
            ProgressBar(
              isExpanded: true,
            ),
            RemainingDuration(),

            SizedBox(
              height: 35,
              width: 10,
            ),
          ],
          onEnded: (data) {
            // print("Next Video Started!");
            widget.onEnd(data);
          },
        ),
        OptionsScreen(),
      ],
    );
  }
}

// bool checkVideo() {
//   // Implement your calls inside these conditions' bodies :
//   if (YoutubePlayer.Value.position == duration(seconds: 0, minutes: 0, hours: 0)) {
//     return true;
//   } else
//     return false;
//}

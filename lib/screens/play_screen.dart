//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/options_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreen extends StatefulWidget {
  final String src;

  const PlayScreen({Key key, this.src, this.url}) : super(key: key);
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
      ),
    );
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
            //  PlayPauseButton(),
            ProgressBar(isExpanded: true),
            RemainingDuration(),
          ],
        ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CircularProgressIndicator(),
        //     SizedBox(height: 10),
        //     Text('Loading...')
        //   ],
        // ),
        OptionsScreen(),
      ],
    );
  }
}

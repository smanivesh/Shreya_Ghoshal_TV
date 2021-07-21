import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:share/share.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
              Transform.rotate(
                angle: 325 * pi / 180,
                child: IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //final RenderBox box = context.findRenderObject();
                    Share.share(
                      'Check this out: song youtube link ',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:tiktok_clone/screens/like_icon.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'DailyPicksandFlicks',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Chicken Completes Agility Course',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // ElevatedButton(
              //   onPressed: () => LikeIcon(),
              //   child: Icon(Icons.thumb_up_outlined, size: 23),
              //   style: ButtonStyle(
              //     backgroundColor:
              //         MaterialStateProperty.all(Colors.transparent),
              //   ),
              // ),
              Icon(Icons.thumb_up_outlined, size: 23),
              //  SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  //final RenderBox box = context.findRenderObject();
                  Share.share(
                      'check out my game app https://play.google.com/store/apps/details?id=com.khopdi.flipout',
                      subject: 'Look what I made!');
                },
                child: Icon(Icons.share, size: 23),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(1.0),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Icon(
        //             Icons.play_arrow_rounded,
        //           ),
        //           Icon(Icons.library_music),
        //           Center(
        //             child: Text(
        //               '00.15',
        //               style: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w400,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

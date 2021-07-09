import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class LikeIcon extends StatefulWidget {
  static var flagsReactions;

  @override
  _LikeIconState createState() => _LikeIconState();
}

class _LikeIconState extends State<LikeIcon> {
  @override
  Widget build(BuildContext context) => FlutterReactionButtonCheck(
        onReactionChanged: (reaction, index, isChecked) {
          print('reaction selected index: $index');
        },
        reactions: <Reaction>[
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'like.gif',
            ),
            icon: buildWidget(
              //icon: 'like_fill.png'
              Icon(Icons.thumb_up),
            ),
          ),
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'love.gif',
            ),
            icon: buildWidget(
                // icon: 'love.png'
                Icon(Icons.favorite)),
          ),
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'wow.gif',
            ),
            icon: buildWidget(
                // icon: 'wow.png'
                Icon(Icons.rate_review)),
          ),
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'haha.gif',
            ),
            icon: buildWidget(
              // icon: 'haha.png'
              Icon(Icons.face),
            ),
          ),
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'sad.gif',
            ),
            icon: buildWidget(
                // icon: 'sad.png'
                Icon(Icons.rate_review)),
          ),
          Reaction(
            previewIcon: buildWidgetPreview(
              icon: 'angry.gif',
            ),
            icon: buildWidget(
                //            icon: 'angry.png'
                Icon(Icons.rate_review)),
          ),
        ],
        initialReaction: Reaction(
          icon: buildWidget(
              //       icon: 'like.png'
              Icon(Icons.rate_review)),
        ),
        selectedReaction: Reaction(
          icon: buildWidget(
            //icon: 'like_fill.png'
            Icon(Icons.thumb_up),
          ),
        ),
      );

  buildWidget(Icon icon) {}

  buildWidgetPreview({String icon}) {}
}

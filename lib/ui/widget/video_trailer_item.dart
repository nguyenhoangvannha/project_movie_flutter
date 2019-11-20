import 'package:flutter/material.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailerItem extends StatelessWidget {
  final Video video;
  final Function onTap;

  VideoTrailerItem(this.video, {this.onTap});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final widthPct =
        mediaQueryData.orientation == Orientation.portrait ? 0.55 : 0.3;
    return Center(
      child: Container(
          width: mediaQueryData.size.width * widthPct,
          margin: EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: this.onTap,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    YoutubePlayer(
                      context: context,
                      videoId: "${video.key}",
                      flags: YoutubePlayerFlags(
                          hideControls: true, autoPlay: false, mute: true),
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 48,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 4, right: 4, top: 4),
                  child: Text(
                    '${video.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

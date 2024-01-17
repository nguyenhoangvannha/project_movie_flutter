import 'package:flutter/material.dart';
import 'package:project_movie_flutter/domain/entity/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTrailerItem extends StatelessWidget {
  final Video video;
  final Function? onTap;
  const VideoTrailerItem(this.video, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final widthPct =
        mediaQueryData.orientation == Orientation.portrait ? 0.55 : 0.3;
    return Center(
      child: Container(
          width: mediaQueryData.size.width * widthPct,
          margin: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: onTap as void Function()?,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: "${video.key}",
                        flags: const YoutubePlayerFlags(
                            hideControls: true, autoPlay: false, mute: true),
                      ),
                    ),
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 48,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
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

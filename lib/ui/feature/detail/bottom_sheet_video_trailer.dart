import 'package:flutter/material.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BottomSheetVideoTrailer extends StatefulWidget {
  final String? title;
  final String? videoKey;

  const BottomSheetVideoTrailer(
      {Key? key, required this.videoKey, required this.title})
      : super(key: key);

  @override
  _BottomSheetVideoTrailerState createState() =>
      _BottomSheetVideoTrailerState();
}

class _BottomSheetVideoTrailerState extends State<BottomSheetVideoTrailer> {
  late YoutubePlayerController _controller;
  double _volume = 50;
  bool _muted = false;

  String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = widget.videoKey;
    _controller = YoutubePlayerController(
      initialVideoId: _videoId!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        // forceHideAnnotation: true,
        // showVideoProgressIndicator: true,
        disableDragSeek: false,
      ),
    );
  }

  @override
  void deactivate() {
    // This pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  _buildVideoPlayer() {
    return YoutubePlayer(
      progressIndicatorColor: const Color(0xFFFF0000),
      bottomActions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.info_outline,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: Text(
            "${widget.title}",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
      progressColors: const ProgressBarColors(
        playedColor: Color(0xFFFF0000),
        handleColor: Color(0xFFFF4433),
      ),
      controller: _controller,
    );
  }

  _buildController() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(
            _controller.value.isPlaying ? Icons.play_arrow : Icons.pause,
          ),
          onPressed: () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
            setState(() {});
          },
        ),
        IconButton(
          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
          onPressed: () {
            _muted ? _controller.unMute() : _controller.mute();
            setState(() {
              _muted = !_muted;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen),
          onPressed: () => _controller.toggleFullScreenMode(),
        ),
      ],
    );
  }

  _buildVolumeController() {
    return Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.translate('label_volume')!,
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        Expanded(
          child: Slider(
            inactiveColor: Colors.transparent,
            value: _volume,
            min: 0.0,
            max: 100.0,
            divisions: 10,
            label: '${(_volume).round()}',
            onChanged: (value) {
              setState(() {
                _volume = value;
              });
              _controller.setVolume(_volume.round());
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return mediaQueryData.orientation == Orientation.portrait
        ? _buildPortrait()
        : _buildLandscape();
  }

  _buildPortrait() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextTitle(widget.title),
            const SizedBox(
              height: 12,
            ),
            _buildVideoPlayer(),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildController(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _buildVolumeController(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildLandscape() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: _buildVideoPlayer(),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: TextTitle(
                      widget.title,
                      maxLines: 2,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: _buildController(),
                  ),
                  Flexible(
                    flex: 1,
                    child: _buildVolumeController(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

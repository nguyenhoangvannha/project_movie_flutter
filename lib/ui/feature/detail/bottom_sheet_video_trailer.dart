import 'package:flutter/material.dart';
import 'package:project_movie_flutter/ui/global/localizations/app_localizations.dart';
import 'package:project_movie_flutter/ui/widget/common/text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BottomSheetVideoTrailer extends StatefulWidget {
  final String title;
  final String videoKey;

  BottomSheetVideoTrailer(
      {Key key, @required this.videoKey, @required this.title})
      : super(key: key);

  @override
  _BottomSheetVideoTrailerState createState() =>
      _BottomSheetVideoTrailerState();
}

class _BottomSheetVideoTrailerState extends State<BottomSheetVideoTrailer> {
  YoutubePlayerController _controller = YoutubePlayerController();
  double _volume = 50;
  bool _muted = false;

  String _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = widget.videoKey;
  }

  void listener() {
//    if (_controller.value.playerState == PlayerState.ENDED) {
//      _showThankYouDialog();
//    }
//    if (mounted) {
//      setState(() {
//        _playerStatus = _controller.value.playerState.toString();
//        _errorCode = _controller.value.errorCode.toString();
//      });
//    }
  }

  @override
  void deactivate() {
    // This pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  _buildVideoPlayer() {
    return YoutubePlayer(
      context: context,
      videoId: _videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        forceHideAnnotation: true,
        showVideoProgressIndicator: true,
        disableDragSeek: false,
      ),
      videoProgressIndicatorColor: Color(0xFFFF0000),
      actions: <Widget>[
        IconButton(
          icon: Icon(
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
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
      progressColors: ProgressColors(
        playedColor: Color(0xFFFF0000),
        handleColor: Color(0xFFFF4433),
      ),
      onPlayerInitialized: (controller) {
        _controller = controller;
        _controller.addListener(listener);
      },
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
          icon: Icon(Icons.fullscreen),
          onPressed: () => _controller.enterFullScreen(),
        ),
      ],
    );
  }

  _buildVolumeController() {
    return Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('label_volume'),
          style: TextStyle(fontWeight: FontWeight.w300),
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
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextTitle(widget.title),
            SizedBox(
              height: 12,
            ),
            _buildVideoPlayer(),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildController(),
                  SizedBox(
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
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: _buildVideoPlayer(),
          ),
          Flexible(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 2, child: TextTitle(widget.title, maxLines: 2,),),
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

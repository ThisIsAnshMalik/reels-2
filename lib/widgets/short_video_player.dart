import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reels_testing/core/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortVideoPlayer extends StatefulWidget {
  const ShortVideoPlayer({
    super.key,
    required this.videoId,
    required this.isActive,
  });

  final String videoId;
  final bool isActive;

  @override
  State<ShortVideoPlayer> createState() => _ShortVideoPlayerState();
}

class _ShortVideoPlayerState extends State<ShortVideoPlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.isActive,
        mute: false,
        loop: true,
        controlsVisibleAtStart: true,
        hideControls: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void didUpdateWidget(ShortVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _controller.play();
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: AppConstants.shortAspectRatio,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
      ),
      builder: (context, player) => player,
    );
  }
}

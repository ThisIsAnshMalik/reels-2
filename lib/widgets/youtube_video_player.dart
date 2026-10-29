import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reels_testing/core/constants.dart';
import 'package:reels_testing/core/youtube_player_config.dart';
import 'package:reels_testing/widgets/video_frame.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  const YoutubeVideoPlayer({
    super.key,
    required this.videoId,
    required this.isActive,
  });

  final String videoId;
  final bool isActive;

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerConfig.flags,
    );
    if (widget.isActive) {
      _controller.play();
    }
  }

  @override
  void didUpdateWidget(YoutubeVideoPlayer oldWidget) {
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

  void _togglePlayback() {
    final playing = _controller.value.isPlaying;
    playing ? _controller.pause() : _controller.play();
  }

  void _playIfActive() {
    if (widget.isActive && !_controller.value.isPlaying) {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: AppConstants.videoAspectRatio,
        showVideoProgressIndicator: false,
        onReady: _playIfActive,
      ),
      builder: (context, player) {
        return VideoFrame(
          aspectRatio: AppConstants.videoAspectRatio,
          onTap: _togglePlayback,
          child: player,
        );
      },
    );
  }
}

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract final class YoutubePlayerConfig {
  static const flags = YoutubePlayerFlags(
    autoPlay: false,
    mute: false,
    loop: true,
    hideControls: true,
    controlsVisibleAtStart: false,
    disableDragSeek: true,
    enableCaption: false,
    showLiveFullscreenButton: false,
  );
}

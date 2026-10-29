import 'package:flutter/material.dart';
import 'package:reels_testing/core/constants.dart';
import 'package:reels_testing/widgets/feed_chrome.dart';
import 'package:reels_testing/widgets/youtube_video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final _pageController = PageController();
  var _currentIndex = 0;
  var _navIndex = 1;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoIds = AppConstants.youtubeVideoIds;

    return Scaffold(
      backgroundColor: Colors.black,
      body: FeedChrome(
        selectedNavIndex: _navIndex,
        onNavTap: (index) => setState(() => _navIndex = index),
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: videoIds.length,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          itemBuilder: (context, index) {
            final id = videoIds[index];
            return YoutubeVideoPlayer(
              key: ValueKey(id),
              videoId: id,
              isActive: index == _currentIndex,
            );
          },
        ),
      ),
    );
  }
}

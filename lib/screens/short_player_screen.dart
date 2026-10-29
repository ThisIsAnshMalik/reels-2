import 'package:flutter/material.dart';
import 'package:reels_testing/core/constants.dart';
import 'package:reels_testing/widgets/fake_bottom_nav_bar.dart';
import 'package:reels_testing/widgets/short_video_player.dart';
import 'package:reels_testing/widgets/shorts_app_bar.dart';

class ShortPlayerScreen extends StatefulWidget {
  const ShortPlayerScreen({super.key});

  @override
  State<ShortPlayerScreen> createState() => _ShortPlayerScreenState();
}

class _ShortPlayerScreenState extends State<ShortPlayerScreen> {
  final PageController _pageController = PageController();
  int _selectedNavIndex = 1;
  int _currentVideoIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const ShortsAppBar(),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: AppConstants.shortVideoIds.length,
        onPageChanged: (index) => setState(() => _currentVideoIndex = index),
        itemBuilder: (context, index) {
          return Center(
            child: AspectRatio(
              aspectRatio: AppConstants.shortAspectRatio,
              child: ShortVideoPlayer(
                key: ValueKey(AppConstants.shortVideoIds[index]),
                videoId: AppConstants.shortVideoIds[index],
                isActive: index == _currentVideoIndex,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: FakeBottomNavBar(
        selectedIndex: _selectedNavIndex,
        onTap: (index) => setState(() => _selectedNavIndex = index),
      ),
    );
  }
}

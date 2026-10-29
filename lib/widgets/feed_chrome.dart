import 'package:flutter/material.dart';
import 'package:reels_testing/widgets/feed_app_bar.dart';
import 'package:reels_testing/widgets/feed_bottom_nav.dart';

class FeedChrome extends StatelessWidget {
  const FeedChrome({
    super.key,
    required this.child,
    required this.selectedNavIndex,
    required this.onNavTap,
  });

  final Widget child;
  final int selectedNavIndex;
  final ValueChanged<int> onNavTap;

  static const _topGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xCC000000), Colors.transparent],
  );

  static const _bottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xE6000000)],
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 120,
          child: IgnorePointer(
            child: DecoratedBox(decoration: BoxDecoration(gradient: _topGradient)),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            bottom: false,
            child: FeedAppBar(),
          ),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 140,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: _bottomGradient),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: FeedBottomNav(
            selectedIndex: selectedNavIndex,
            onTap: onNavTap,
          ),
        ),
      ],
    );
  }
}

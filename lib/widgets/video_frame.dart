import 'package:flutter/material.dart';

class VideoFrame extends StatelessWidget {
  const VideoFrame({
    super.key,
    required this.aspectRatio,
    required this.child,
    this.onTap,
  });

  final double aspectRatio;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var width = constraints.maxWidth;
        var height = width / aspectRatio;
        if (height > constraints.maxHeight) {
          height = constraints.maxHeight;
          width = height * aspectRatio;
        }

        return Center(
          child: SizedBox(
            width: width,
            height: height,
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: child,
            ),
          ),
        );
      },
    );
  }
}

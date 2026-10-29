import 'package:flutter/material.dart';
import 'package:reels_testing/core/app_theme.dart';
import 'package:reels_testing/screens/reels_screen.dart';

class ReelsApp extends StatelessWidget {
  const ReelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reels',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const ReelsScreen(),
    );
  }
}

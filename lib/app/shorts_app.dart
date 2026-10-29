import 'package:flutter/material.dart';
import 'package:reels_testing/core/app_theme.dart';
import 'package:reels_testing/screens/short_player_screen.dart';

class ShortsApp extends StatelessWidget {
  const ShortsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Short',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const ShortPlayerScreen(),
    );
  }
}

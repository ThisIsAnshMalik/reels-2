import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reels_testing/widgets/feed_app_bar.dart';

void main() {
  testWidgets('Feed app bar shows navigation actions', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: FeedAppBar())),
    );

    expect(find.byIcon(Icons.arrow_back_ios_new), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}

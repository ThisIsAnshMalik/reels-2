import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reels_testing/widgets/shorts_app_bar.dart';

void main() {
  testWidgets('Shorts app bar shows title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(appBar: const ShortsAppBar()),
      ),
    );

    expect(find.text('Shorts'), findsOneWidget);
  });
}

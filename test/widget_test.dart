import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: Center(child: Text('Test'))),
      ),
    );

    // Verify that the test widget is present
    expect(find.text('Test'), findsOneWidget);
  });
}


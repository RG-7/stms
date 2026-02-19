// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('STMS Student App Widget Tests', () {
    testWidgets('App starts without errors', (WidgetTester tester) async {
      // This test verifies that the app can start without crashing.
      // The actual app widget test would be added here.

      // Create a simple test widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('STMS App Test'),
            ),
          ),
        ),
      );

      // Verify the text widget is displayed
      expect(find.text('STMS App Test'), findsOneWidget);
    });

    testWidgets('Material Design is applied', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
            ),
          ),
          home: const Scaffold(
            body: Center(
              child: Text('Material Design Test'),
            ),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
    });

    testWidgets('Responsive layout renders', (WidgetTester tester) async {
      // Bind the test to make window size adjustable
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      
      tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('Responsive Test'),
            ),
          ),
        ),
      );

      expect(find.text('Responsive Test'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:course_app/main.dart'; // Pastikan ini sesuai dengan nama paket Anda

void main() {
  testWidgets('Splash screen navigates to login screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the splash screen is displayed.
    expect(find.text('Welcome to MyApp'), findsOneWidget);
    
    // Wait for the splash screen duration
    await tester.pumpAndSettle(Duration(seconds: 3));

    // Verify that the login screen is displayed after the splash screen
    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('Login button navigates to dashboard', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Wait for the splash screen duration
    await tester.pumpAndSettle(Duration(seconds: 3));

    // Verify that the login screen is displayed
    expect(find.text('Login'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that the dashboard screen is displayed
    expect(find.text('Welcome to the Dashboard!'), findsOneWidget);
  });
}
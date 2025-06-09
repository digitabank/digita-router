import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digita_router/digita_router.dart';

void main() {
  testWidgets('Test 1. digita.goTo() and digita.goBack() work correctly', (
    WidgetTester tester,
  ) async {
    // Create test page
    final pageA = Scaffold(body: Text('Page A'));
    final pageB = Scaffold(body: Text('Page B'));

    // Create test app to test navigation
    await tester.pumpWidget(
      MaterialApp(
        navigatorKey: digita.navigatorKey, // this will activate digita router
        home: pageA,
      ),
    );

    // Verify initial page
    expect(find.text('Page A'), findsOneWidget);
    expect(find.text('Page B'), findsNothing);

    // Push pageB
    digita.goTo(pageB);
    await tester.pumpAndSettle();

    // Verify pageB is shown
    expect(find.text('Page B'), findsOneWidget);

    // Go back to pageA
    digita.goBack();
    await tester.pumpAndSettle();

    // Verify pageA is shown again
    expect(find.text('Page A'), findsOneWidget);
  });
}

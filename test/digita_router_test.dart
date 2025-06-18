import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digita_router/digita_router.dart';

// Dummy pages for testing navigation

/// Sample HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: const Text('Home Page')); // Sample home page with text
}

/// Sample DetailsPage
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: const Text('Details Page')); // Sample details page
}

/// Sample AnotherPage
class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: const Text('Another Page')); // Sample another page
}

void main() {
  // Helper function to create the test app wrapped in MaterialApp
  // Injects the global navigatorKey from digita_router for context-free navigation
  Widget createApp() {
    return MaterialApp(
      //Inject this line to enable global navigation control
      navigatorKey: digita.navigatorKey,

      // App routes
      routes: {
        '/': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
        '/another': (_) => const AnotherPage(),
      },
      initialRoute: '/', // Start at home page by default
    );
  }

  testWidgets('digita_router navigation test', (WidgetTester tester) async {
    // Render the app widget tree
    await tester.pumpWidget(createApp());

    // Verify initial state: HomePage should be visible
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Details Page'), findsNothing);

    // Use digita_router to open DetailsPage directly by widget
    digita.openPage(const DetailsPage());
    await tester.pumpAndSettle(); // Wait for navigation animation to complete

    // Confirm that DetailsPage is now displayed instead of HomePage
    expect(find.text('Details Page'), findsOneWidget);
    expect(find.text('Home Page'), findsNothing);

    // Navigate back to previous page (HomePage) using digita.goBack()
    digita.closePage();
    await tester.pumpAndSettle();

    // HomePage should be visible again, DetailsPage hidden
    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Details Page'), findsNothing);

    // Navigate to DetailsPage using named route
    digita.openRoute('/details');
    await tester.pumpAndSettle();

    // Verify DetailsPage is shown
    expect(find.text('Details Page'), findsOneWidget);

    // Replace current page with AnotherPage widget (no back stack)
    digita.replacePageWith(const AnotherPage());
    await tester.pumpAndSettle();

    // AnotherPage should now be visible, DetailsPage removed
    expect(find.text('Another Page'), findsOneWidget);
    expect(find.text('Details Page'), findsNothing);

    // Close all pages and navigate back to root ('/')
    digita.closeAllPages();
    await tester.pumpAndSettle();

    // Confirm we are back to HomePage
    expect(find.text('Home Page'), findsOneWidget);
  });

  testWidgets('digita_router goBackUntil test', (WidgetTester tester) async {
    // Render the app widget tree
    await tester.pumpWidget(createApp());

    // Push '/details' named route onto the stack
    digita.openRoute('/details');
    await tester.pumpAndSettle();

    // Push '/another' named route on top
    digita.openRoute('/another');
    await tester.pumpAndSettle();

    // Verify AnotherPage is currently shown
    expect(find.text('Another Page'), findsOneWidget);

    // Pop navigation stack until reaching the route named '/'
    digita.goBackUntil('/');
    await tester.pumpAndSettle();

    // Confirm HomePage is displayed after popping intermediate routes
    expect(find.text('Home Page'), findsOneWidget);
  });
}

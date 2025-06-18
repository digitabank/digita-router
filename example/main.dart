import 'package:flutter/material.dart';
// Import digita_router package to access 'digita' for context-free navigation
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the app.
///
/// IMPORTANT:
/// To enable Digita's navigation anywhere without BuildContext,
/// you MUST assign `digita.navigatorKey` to MaterialApp's `navigatorKey` parameter.
/// This connects Digita's internal navigator to your app.
///
/// This example demonstrates both widget-based and named route navigation,
/// showing how you can use either or both approaches seamlessly.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Assign Digita's global navigator key to enable context-free navigation.
      navigatorKey: digita.navigatorKey,

      // Define named routes to use named navigation.
      routes: {
        '/': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
        '/another': (_) => const AnotherPage(),
      },
    );
  }
}

/// The home screen of the app.
///
/// Demonstrates two main navigation methods:
/// 1. Widget-based navigation using `digita.openPage()`
/// 2. Named route navigation using `digita.openRoute()`
///
/// Both methods do NOT require a BuildContext, simplifying your navigation calls.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to DetailsPage by pushing a widget.
                // No BuildContext required.
                digita.openPage(const DetailsPage());
              },
              child: const Text('View Details (Page based)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to DetailsPage by named route.
                digita.openRoute('/details');
              },
              child: const Text('View Details (Route based)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to AnotherPage by named route.
                digita.openRoute('/another');
              },
              child: const Text('Go to Another Page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The details screen.
///
/// Shows how to close the current page and return to the previous screen
/// without requiring BuildContext by using `digita.closePage()`.
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pop the current page off the navigation stack.
            // You also can use digita.goBack()
            digita.closePage();
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

/// An additional page to demonstrate navigation.
///
/// Also uses `digita.closePage()` to return to the previous page without BuildContext.
class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Another Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Go back to the previous page without requiring BuildContext.
            // You also can use digita.goBack()
            digita.closePage();
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

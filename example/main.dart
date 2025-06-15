import 'package:flutter/material.dart';
// import digita_router to access 'digita' for amazing flutter navigation
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(MyApp());
}

/// The root widget of the app
/// add --->  navigatorKey: digita.navigatorKey
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Required: attach Digita's navigatorKey to MaterialApp
      // Just add this one line and digita_router is ready to go!
      navigatorKey: digita.navigatorKey, // <--- This one line does the magic!
      // Declare routes below if you want named navigation,
      // or simply omit this if you prefer widget-based navigation.
      // digita_router supports both:
      // digita.goTo(DetailsPage()) and digita.goToNamed('/details')
      routes: {
        '/': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}

/// The home page with a button to navigate to the details page
/// using digita commands: digita.goTo() or digita.goToNamed()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          // Navigate to the DetailsPage without context
          onPressed: () {
            // This is very simple, clean, fast, memorable, and everyone loves it — just amazing!
            digita.goTo(const DetailsPage());

            // Or use this for named route navigation:
            // digita.goToNamed('/details');
          },
          child: const Text('View Details'),
        ),
      ),
    );
  }
}

/// The details page with a button to go back
/// using the digita command: digita.goBack()
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          // Go back to the previous screen without context
          // This is also just amazing!
          onPressed: () => digita.goBack(),
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

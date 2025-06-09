import 'package:flutter/material.dart';
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(MyApp());
}

/// The root widget of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  Required: attach Digita's navigatorKey to MaterialApp.
      navigatorKey: digita.navigatorKey,
      routes: {
        '/': (_) => HomePage(),
        '/details': (_) => DetailsPage(),
      },
    );
  }
}

/// The home page with a button to navigate to the details page.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          //  Navigate to the named route '/details' without using context.
          onPressed: () {
            digita.goToNamed('/details');
          },
          child: Text('View Details'),
        ),
      ),
    );
  }
}

/// The details page with a button to go back.
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Center(
        child: ElevatedButton(
          //  Go back to the previous screen without context.
          onPressed: () => digita.goBack(),
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

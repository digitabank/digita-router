# digita-router

A **lightweight, context-free navigation package** for Flutter, written entirely in Dart. Navigate between pages without needing `BuildContext`, perfect for any architecture — including **MVVM, BLoC, Riverpod, or plain Flutter**.

---

## Features

- No `BuildContext` needed
- Simple and declarative navigation API
- Seamlessly integrates with Flutter's built-in routing
- Compatible with architectures like BLoC, Riverpod, MVVM, and plain Flutter
- Designed for testability, maintainability, and scalability

---

## You are invited to contribute!

If you are a Flutter developer eager to contribute, you're more than welcome!  
Open issues, submit pull requests, or suggest new features — and become part of the team behind [digita_router](https://github.com/digitabank/digita-router).  
Check out the [contributing guide](https://github.com/digitabank/digita-router/blob/main/CONTRIBUTING.md) to get started.

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digita_router: ^0.1.0
```

Then run

```bash
flutter pub get
```

Or install directly with:

```bash
flutter pub add digita_router
```

## Getting Started

`digita` is a global instance providing navigation methods without context

### 1. Just inject the navigatorKey and use it on the go

```dart
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
      // digita.goTo(const DetailsPage()) and digita.goToNamed('/details')
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

```

### 2. Use the navigation methods — anywhere, no context required!

```dart
// Push a widget
digita.goTo(const DetailsPage());

// Push named route
digita.goToNamed('/details', arguments: {'userId': 123});

// Replace current with a widget
digita.replaceWith(const SettingsPage());

// Replace current page with a named route
digita.replaceNamed('/settings');

// Go back
digita.goBack();

// Pop pages until route name
digita.goBackUntil('/');
```

## Testing Support

The package supports Flutter’s widget testing out of the box. Inject `digita.navigatorKey` into `MaterialApp`, and control navigation easily in your widget tests.

## API Reference

| Method                                                | Description                                     |
| ----------------------------------------------------- | ----------------------------------------------- |
| `goTo(Widget page)`                                   | Pushes a new page                               |
| `goToNamed(String routeName, {Object? arguments})`    | Pushes a named route                            |
| `goBack()`                                            | Pops the current route                          |
| `goBackUntil(String routeName)`                       | Pops until a route with the given name is found |
| `replaceWith(Widget page)`                            | Replaces current route with a widget route      |
| `replaceNamed(String routeName, {Object? arguments})` | Replaces current route with a named route       |

## Example

1. `digita.goTo()`

```dart
ElevatedButton(
  onPressed: () => digita.goTo(const DetailsPage()),
  child: const Text('View Details'),
);
```

2. `digita.goToNamed()`

```dart
ElevatedButton(
  onPressed: () => digita.goToNamed('/details'),
  child: const Text('View Details'),
);
```

3. `digita.goBack()`

```dart
ElevatedButton(
  onPressed: () => digita.goBack(),
  child: const Text('Go Back'),
);
```

- Github repository: [digita-router: https://github.com/digitabank/digita-router](https://github.com/digitabank/digita-router)

## License

MIT © [DIGITA BANK](https://digitabank.com)

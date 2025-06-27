# digita-router

[![Pub Version](https://img.shields.io/pub/v/digita_router)](https://pub.dev/packages/digita_router)
[![Platform](https://img.shields.io/badge/platform-flutter-blue)](https://flutter.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](https://opensource.org/licenses/MIT)

A **lightweight, context-free navigation package** for Flutter, written entirely in Dart. Navigate between pages without needing `BuildContext`.

## Works with any architecture

Whether you're using:

- BLoC
- Riverpod
- Provider
- MVVM
- Clean Architecture

`digita_router` lets you navigate globally with no `BuildContext`, improving readability, functionality and testability.

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
Check out the [contributing guide](https://github.com/digitabank/digita-router/blob/main/CONTRIBUTING.md) to get started.

---

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  digita_router: ^0.3.0
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

### 1. Import digita_router and inject the navigatorKey and use it on the go

```dart
import 'package:flutter/material.dart';

// Import digita_router
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Just add this one line and digita_router is ready to go!
      navigatorKey: digita.navigatorKey, // <--- Must add this line
      routes: {
        '/': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
        '/another': (_) => const AnotherPage(),
      },
    );
  }
}

```

### 2. Use Anywhere — Without Context

```dart
// Push a widget-based page
digita.goTo(const DetailsPage());

// Go back to the previous page
digita.goBack();

// Go back until a named route is found on the stack
digita.goBackTo('/');

// Close all pages and go back to home
digita.closeAllPages();


// Replace current with widget
digita.replacePageWith(const AnotherPage());

// Replace current with named route
digita.replaceRouteWith('/another');

```

## Example uses of digita_router

```dart
// Push a new widget-based page onto the stack
ElevatedButton(
  onPressed: () => digita.goTo(const DetailsPage()),
  child: const Text('View Details'),
);

// Close the current page and go back to the previous page
ElevatedButton(
  onPressed: () => digita.goBack(),
  child: const Text('Go Back'),
);

// Go back until a named route is found on the stack
ElevatedButton(
  onPressed: () => digita.goBackTo('/'),
  child: const Text('Go Back to Home'),
);

// Close all pages and return to the root ("/") route
ElevatedButton(
  onPressed: () => digita.closeAllPages(),
  child: const Text('Back to Home'),
);

// Navigate to a named route (pushes '/details' onto the stack)
ElevatedButton(
  onPressed: () => digita.goToRoute('/details'),
  child: const Text('View Details (Named)'),
);

// Replace the current page with a new widget-based page (no back stack)
ElevatedButton(
  onPressed: () => digita.replacePageWith(const AnotherPage()),
  child: const Text('Replace with Another Page'),
);

// Replace the current page with a named route (no back stack)
ElevatedButton(
  onPressed: () => digita.replaceRouteWith('/another'),
  child: const Text('Replace with Named Route'),
);


```

## Testing Support

The package supports Flutter’s widget testing out of the box. Inject `digita.navigatorKey` into `MaterialApp`, and control navigation easily in your widget tests.

## API Reference

| Method                                                    | Description                                                            |
| --------------------------------------------------------- | ---------------------------------------------------------------------- |
| `goTo(Widget page)`                                       | Pushes a new widget-based page onto the navigation stack               |
| `goBack()`                                                | Pops the current page off the navigation stack (go back)               |
| `closeAllPages()`                                         | Pops all pages until reaching the root (first) page                    |
| `goToRoute(String routeName, {Object? arguments})`        | Pushes a named route onto the navigation stack                         |
| `goBackTo(String routeName)`                              | Pops pages until the route with the specified name is reached          |
| `replacePageWith(Widget page)`                            | Replaces the current page with a new widget-based page (no back stack) |
| `replaceRouteWith(String routeName, {Object? arguments})` | Replaces the current page with a named route (no back stack)           |

## Repository

- GitHub: [digitabank/digita-router](https://github.com/digitabank/digita-router)
- Created by [@digitacoder](https://github.com/digitacoder)
- Published and maintained by [DIGITA BANK](https://github.com/digitabank)

## License

MIT © [DIGITA BANK](https://digitabank.com)

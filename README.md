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

## You Are Invited to Contribute!!

If you're a Flutter developer eager to contribute, you're more than welcome!  
Open issues, submit pull requests, or suggest new features  
— and become part of the team behind `digita_router`.  
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

### 1. Inject the navigatorKey

```dart
// Import digita_router
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: digita.navigatorKey, // Just add this line to enable digita_router
      routes: {
        '/': (_) => HomePage(),
        '/details': (_) => DetailsPage(),
      },
    );
  }
}
```

### 2. Use the navigation methods — anywhere, no context required!

```dart
// Push a widget
digita.goTo(DetailsPage());

// Push named route
digita.goToNamed('/details', arguments: {'userId': 123});

// Replace current with a widget
digita.replaceWith(SettingsPage());

// Replace current page with a named route
digita.replaceNamed('/settings');

// Go back
digita.goBack();

// Pop pages until route name
digita.goBackUntil('/');
```

## Testing Support

The package supports Flutter’s widget testing out of the box. Inject `digita.navigatorKey` into `MaterialApp`, and control navigation easily in your widget tests.

## API references

| Method                                                | Description                                     |
| ----------------------------------------------------- | ----------------------------------------------- |
| `goTo(Widget page)`                                   | Pushes a new page                               |
| `goToNamed(String routeName, {Object? arguments})`    | Pushes a named route                            |
| `goBack()`                                            | Pops the current route                          |
| `goBackUntil(String routeName)`                       | Pops until a route with the given name is found |
| `replaceWith(Widget page)`                            | Replaces current route with a widget route      |
| `replaceNamed(String routeName, {Object? arguments})` | Replaces current route with a named route       |

## Example

```dart
ElevatedButton(
  onPressed: () => digita.goToNamed('/details', arguments: {'id': 123}),
  child: Text('View Details'),
);
```

## Github repository: [digita-router: https://github.com/digitabank/digita-router](https://github.com/digitabank/digita-router)

## License

MIT © [DIGITA BANK](https://digitabank.com)

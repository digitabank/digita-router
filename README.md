# digita-router

A **lightweight, context-free navigation package** for Flutter, written entirely in Dart. Navigate between pages without needing `BuildContext`, perfect for any architecture — including **MVVM, BLoC, Riverpod, or plain Flutter**.

---

## ✨ Features

- 🚫 No `BuildContext` needed
- 🔁 Simple, declarative navigation API
- 📦 Works with Flutter's built-in routing
- ✅ Designed for testability and scalability

---

## 📦 Installation

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

## 🚀 Getting Started

### 1. Inject the navigatorKey

```dart
import 'package:digita_router/digita_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: digita.navigatorKey, // remember to add this line
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

## 🧪 Testing Support

The package supports Flutter’s widget testing out of the box. Inject `digita.navigatorKey` into `MaterialApp`, and control navigation easily in your widget tests.

## 📚 API references

| Method                                                | Description                                     |
| ----------------------------------------------------- | ----------------------------------------------- |
| `goTo(Widget page)`                                   | Pushes a new page                               |
| `goToNamed(String routeName, {Object? arguments})`    | Pushes a named route                            |
| `goBack()`                                            | Pops the current route                          |
| `goBackUntil(String routeName)`                       | Pops until a route with the given name is found |
| `replaceWith(Widget page)`                            | Replaces current route with a widget route      |
| `replaceNamed(String routeName, {Object? arguments})` | Replaces current route with a named route       |

## 💡 Example

```dart
ElevatedButton(
  onPressed: () => digita.goToNamed('/details', arguments: {'id': 123}),
  child: Text('View Details'),
);
```

## 📄 License

MIT © [DIGITA BANK](https://digitabank.com)

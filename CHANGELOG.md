## 0.2.0

### Added

- New, more readable and developer-friendly navigation methods:
  - `openPage()`
  - `closePage()`
  - `closeAllPages()`
  - `openRoute()`
  - `closeRoute()`
  - `replacePageWith()` — replaces deprecated `replaceWith()`
  - `replaceRouteWith()` — replaces deprecated `replaceNamed()`
- Updated example code with detailed comments for improved clarity.
- Improved documentation and added a comprehensive example demonstrating both widget-based and named route navigation.

- Added widget tests for `digita_router` navigation functionalities:
  - Navigation without context by pushing widget-based pages.
  - Named route navigation.
  - Page replacement with widget and named routes.
  - `goBack` and `goBackUntil` navigation behaviors.
  - `closeAllPages()` functionality returning to root.
- Created dummy `HomePage`, `DetailsPage`, and `AnotherPage` widgets to support navigation tests.
- Configured `MaterialApp` with injected `digita.navigatorKey` for context-free navigation testing.

## 0.1.0

- Initial stable release of `digita_router`
- Provides context-free navigation using a global `navigatorKey`
- Works with Flutter’s built-in `MaterialApp` routes
- Includes core methods:
  - `goTo()`
  - `goToNamed()`
  - `goBack()`
  - `goBackUntil()`
  - `replaceWith()`
  - `replaceNamed()`
- Comes with widget tests for core navigation flows
- Includes a complete `example/` app demonstrating usage
- Added `const` constructors in example code for performance
- Cleaned up metadata, README, and pubspec for pub.dev compliance

## 0.0.2

- Minor fixes and improvements
- Updated documentation and metadata

## 0.0.1

Initial release of `digita_router`

- Provides context-free navigation for Flutter apps using a global `navigatorKey`
- Easy-to-use methods:
  - `goTo()`, `goToNamed()`
  - `goBack()`, `goBackUntil()`
  - `replaceWith()`, `replaceNamed()`
- Fully compatible with any architecture (e.g., MVVM, BLoC, Riverpod, plain Flutter)
- Includes widget tests covering core navigation use cases
- Comes with an example app demonstrating real usage

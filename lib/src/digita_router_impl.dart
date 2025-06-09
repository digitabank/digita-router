import 'package:flutter/material.dart';

/// A lightweight, context-free navigation helper for Flutter.
///
/// Use `digita` to navigate between pages without needing a [BuildContext].
class Digita {
  static final Digita instance = Digita._internal();
  factory Digita() => instance;
  Digita._internal();

  /// The global navigator key required to initialize Digita.
  ///
  /// Must be assigned to `navigatorKey` in your [MaterialApp].
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Push a new [Widget] page onto the navigation stack.
  Future<dynamic>? goTo(Widget page) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push a named route onto the navigation stack.
  ///
  /// Optionally pass [arguments].
  Future<dynamic>? goToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Pop the current page off the stack.
  void goBack() {
    return navigatorKey.currentState?.pop();
  }

  /// Pop pages until the specified [routeName] is reached.
  void goBackUntil(String routeName) {
    return navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Replace the current page with a new [Widget] page.
  Future<dynamic>? replaceWith(Widget page) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace the current page with a named route.
  ///
  /// Optionally pass [arguments].
  Future<dynamic>? replaceNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
}

/// Instance of [Digita] for easy navigation access.
final Digita digita = Digita();

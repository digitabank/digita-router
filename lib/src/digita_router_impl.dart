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

  /// Ensure digita router is ready
  ///
  /// Assign (navigatorKey: digita.navigatorKey) to your MaterialApp
  void ensureRouterIsReady() {
    if (navigatorKey.currentState == null) {
      debugPrint(
          '[Digita] Navigator is not ready. Make sure you assigned [navigatorKey: digita.navigatorKey] to MaterialApp');
      throw Exception('Navigator not ready');
    }
  }

  /// Push a new [Widget] page onto the navigation stack.
  Future<Object?>? openPage(Widget page) {
    ensureRouterIsReady();
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pop the current page off the stack.
  void closePage() {
    navigatorKey.currentState?.pop();
  }

  /// Pop all pages off the stack until the root ('/') route.
  void closeAllPages() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  /// Push a new [Widget] page onto the navigation stack.
  ///
  /// Alias for [openPage].
  Future<Object?>? goTo(Widget page) {
    return openPage(page);
  }

  /// Push a named route onto the navigation stack.
  /// Optionally pass [arguments].
  Future<Object?>? openRoute(String routeName, {Object? arguments}) {
    ensureRouterIsReady();
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Close the current route and go back to the previous
  ///
  /// Alias for [closePage].
  void closeRoute() {
    closePage();
  }

  /// Push a named route onto the navigation stack.
  /// Optionally pass [arguments].
  /// Alias for [openRoute].
  Future<Object?>? goToRoute(String routeName, {Object? arguments}) {
    ensureRouterIsReady();
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Go back to the previous page.
  ///
  /// Alias for [closePage].
  void goBack() {
    closePage();
  }

  /// Pop pages until the specified [routeName] is reached.
  void goBackUntil(String routeName) {
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Replace the current page with a new [Widget] page.
  Future<Object?>? replacePageWith(Widget page) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace the current page with a named route.
  /// Optionally pass [arguments].
  Future<Object?>? replaceRouteWith(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// ------------------
  /// Deprecated methods
  /// ------------------
  ///
  /// Replace the current page with a new [Widget] page.
  ///
  /// Deprecated: Use [replacePageWith] instead.
  @Deprecated('Use replacePageWith instead')
  Future<Object?>? replaceWith(Widget page) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replace the current page with a named route.
  ///
  /// Deprecated: Use [replaceRouteWith] instead.
  @Deprecated('Use replaceRouteWith instead')
  Future<Object?>? replaceNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Push a named route onto the navigation stack.
  ///
  /// Deprecated: Use [goToRoute] instead.
  @Deprecated('Use goToRoute instead')
  Future<Object?>? goToNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }
}

/// Instance of [Digita] for easy navigation access.
final Digita digita = Digita();

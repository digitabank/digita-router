import 'package:flutter/material.dart';

/// A lightweight, context-free navigation helper for Flutter.
///
/// Use [digita] to navigate between pages without needing a [BuildContext].
class Digita {
  Digita._internal();
  static final Digita instance = Digita._internal();

  /// Global navigator key to be set in your [MaterialApp].
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Ensures that the navigator is available before navigation operations.
  void _ensureRouterIsReady() {
    final isReady = navigatorKey.currentState != null;
    if (!isReady) {
      debugPrint(
        '[Digita] Navigator not ready. Assign [navigatorKey: digita.navigatorKey] to your MaterialApp.',
      );
      throw Exception('Navigator not ready');
    }
  }

  /// Pushes a [page] onto the navigation stack.
  Future<Object?>? goTo(Widget page) {
    _ensureRouterIsReady();
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pops the current page off the stack.
  void goBack() {
    _ensureRouterIsReady();
    navigatorKey.currentState?.pop();
  }

  /// Pushes a named route onto the stack.
  Future<Object?>? goToRoute(String routeName, {Object? arguments}) {
    _ensureRouterIsReady();
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Pops pages until the route with [routeName] is reached.
  void goBackTo(String routeName) {
    _ensureRouterIsReady();
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  /// Replaces the current page with a new [page].
  Future<Object?>? replacePageWith(Widget page) {
    _ensureRouterIsReady();
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Replaces the current page with a named route.
  Future<Object?>? replaceRouteWith(String routeName, {Object? arguments}) {
    _ensureRouterIsReady();
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  /// Pops all pages until reaching the root (first) page.
  void closeAllPages() {
    _ensureRouterIsReady();
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  // --- Deprecated Methods ---

  /// Deprecated: Use [goTo] instead.
  @Deprecated('Use goTo instead')
  Future<Object?>? openPage(Widget page) {
    _ensureRouterIsReady();
    return goTo(page);
  }

  /// Deprecated: Use [goBack] instead.
  @Deprecated('Use goBack instead')
  void closePage() => goBack();

  /// Deprecated: Use [goBack] instead.
  @Deprecated('Use goBack instead')
  void closeRoute() => goBack();

  /// Deprecated: Use [goBackTo] instead.
  @Deprecated('Use goBackTo instead')
  void goBackUntil(String routeName) => goBackTo(routeName);

  /// Deprecated: Use [replacePageWith] instead.
  @Deprecated('Use replacePageWith instead')
  Future<Object?>? replaceWith(Widget page) => replacePageWith(page);

  /// Deprecated: Use [replaceRouteWith] instead.
  @Deprecated('Use replaceRouteWith instead')
  Future<Object?>? replaceNamed(String routeName, {Object? arguments}) =>
      replaceRouteWith(routeName, arguments: arguments);

  /// Deprecated: Use [goToRoute] instead.
  @Deprecated('Use goToRoute instead')
  Future<Object?>? goToNamed(String routeName, {Object? arguments}) =>
      goToRoute(routeName, arguments: arguments);

  /// Deprecated: Use [goToRoute] instead.
  @Deprecated('Use goToRoute instead')
  Future<Object?>? openRoute(String routeName, {Object? arguments}) =>
      goToRoute(routeName, arguments: arguments);
}

/// Singleton instance of [Digita] for global navigation access.
final Digita digita = Digita.instance;

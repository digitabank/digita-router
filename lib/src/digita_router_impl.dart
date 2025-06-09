import 'package:flutter/material.dart';

class Digita {
  static final Digita instance = Digita._internal();
  factory Digita() => instance;
  Digita._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  bool _warned = false;

  void _warnIfNavigatorNotReady() {
    if (!_warned && navigatorKey.currentState == null) {
      _warned = true;
      // Only show in debug mode
      assert(() {
        debugPrint(
          '[digita_router] Warning: navigatorKey is not attached.\n'
          'Make sure to assign `digita.navigatorKey` to your MaterialApp.\n\n'
          'MaterialApp(\n  navigatorKey: digita.navigatorKey,\n  ...\n)',
        );
        return true;
      }());
    }
  }

  Future<dynamic>? goTo(Widget page) {
    _warnIfNavigatorNotReady();
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<dynamic>? goToNamed(String routeName, {Object? arguments}) {
    _warnIfNavigatorNotReady();
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  void goBack() {
    _warnIfNavigatorNotReady();
    navigatorKey.currentState?.pop();
  }

  void goBackUntil(String routeName) {
    _warnIfNavigatorNotReady();
    navigatorKey.currentState?.popUntil(ModalRoute.withName(routeName));
  }

  Future<dynamic>? replaceWith(Widget page) {
    _warnIfNavigatorNotReady();
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<dynamic>? replaceNamed(String routeName, {Object? arguments}) {
    _warnIfNavigatorNotReady();
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }
}

final Digita digita = Digita();

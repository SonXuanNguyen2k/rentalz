import 'package:flutter/material.dart';

/// This service is extremely useful if u want to show a snackbar or do
/// something else that should depend on a global BuildContext instead of the
/// ephemeral one, which might quickly get removed when Navigator.popUntil()
/// or Navigator.pop(context) is called.
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void popAllRoutesExceptFirst() =>
      NavigationService.navigatorKey.currentState!
          .popUntil((route) => route.isFirst);

  static Future<T?> pushNewPage<T extends Object?>(Widget page) =>
      NavigationService.navigatorKey.currentState!
          .push(MaterialPageRoute<T>(builder: (_) => page));
}

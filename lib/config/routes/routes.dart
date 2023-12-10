import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> defaultRoutes = {
    '/': (context) => Container(),
  };

  static Map<String, Widget Function(BuildContext)> authRoutes = {
    '/': (context) => Container(),
  };
}

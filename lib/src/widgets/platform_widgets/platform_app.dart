import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformApp extends StatelessWidget {
  final bool isIOS = Platform.isIOS;
  final Widget home;
  final ThemeData? mTheme;
  final CupertinoThemeData? cTheme;
  final String? initialRoute;
  final Map<String, Widget Function(BuildContext)>? routes;

  PlatformApp(
      {Key? key,
      required this.home,
      this.mTheme,
      this.cTheme,
      this.routes,
      this.initialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matTheme = mTheme ?? ThemeData();
    final cupTheme = cTheme ?? const CupertinoThemeData();
    return isIOS
        ? CupertinoApp(
            home: home,
            theme: cupTheme,
            initialRoute: initialRoute,
            routes: routes ?? {},
          )
        : MaterialApp(
            home: home,
            theme: matTheme,
            initialRoute: initialRoute,
            routes: routes ?? {},
          );
  }
}

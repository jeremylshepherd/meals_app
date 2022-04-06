import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformPageRoute {
  static CupertinoPageRoute cupPage(BuildContext context, Widget page) {
    return CupertinoPageRoute(builder: (context) => page);
  }

  static MaterialPageRoute matPage(BuildContext context, Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}

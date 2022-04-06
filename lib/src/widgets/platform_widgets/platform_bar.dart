import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformBar {
  final bool isIOS = Platform.isIOS;

  static CupertinoNavigationBar cupAppBar(
      Widget title, Color? backgroundColor) {
    return CupertinoNavigationBar(
      leading: title,
      backgroundColor: backgroundColor ?? Colors.blue,
    );
  }

  static AppBar matAppBar(Widget title, Color? backgroundColor) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor ?? Colors.blue,
    );
  }
}

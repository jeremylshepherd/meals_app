import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class xInkWell extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const xInkWell({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? InkWell(
            child: child,
            onTap: onTap,
          )
        : GestureDetector(
            onTap: onTap,
            child: child,
          );
  }
}

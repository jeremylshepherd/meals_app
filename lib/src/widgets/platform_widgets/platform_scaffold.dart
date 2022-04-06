import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends StatelessWidget {
  final bool isIOS = Platform.isIOS;
  final dynamic platformBar;
  final Widget body;

  PlatformScaffold({
    Key? key,
    required this.body,
    required this.platformBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isIOS ? _buildIOSScaffold() : _buildMaterialScaffold();
  }

  Widget _buildIOSScaffold() {
    final ObstructingPreferredSizeWidget cupertinoNavigationBar = platformBar;
    return CupertinoPageScaffold(
      navigationBar: cupertinoNavigationBar,
      child: body,
    );
  }

  Widget _buildMaterialScaffold() {
    final PreferredSizeWidget appBar = platformBar;
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/platform_widgets/platform_bar.dart';
import '../widgets/platform_widgets/platform_scaffold.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({
    Key? key,
    // required this.categoryId,
    // required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    var bar = Platform.isIOS
        ? PlatformBar.cupAppBar(
            Text(categoryTitle!), Theme.of(context).primaryColor)
        : PlatformBar.matAppBar(
            Text(categoryTitle!), Theme.of(context).primaryColor);
    return PlatformScaffold(
      platformBar: bar,
      body: const Center(
        child: Text('The recipes for this category'),
      ),
    );
  }
}

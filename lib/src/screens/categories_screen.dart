import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/platform_widgets/platform_scaffold.dart';
import '../widgets/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'DeliMeals';
    final platformBar = Platform.isIOS
        ? const CupertinoNavigationBar(
            leading: Text(appTitle),
          )
        : AppBar(
            title: const Text(appTitle),
          );
    return PlatformScaffold(
      platformBar: platformBar,
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (cat) => CategoryItem(
                key: ValueKey(cat.id),
                id: cat.id,
                title: cat.title,
                color: cat.color,
              ),
            )
            .toList(),
      ),
    );
  }
}

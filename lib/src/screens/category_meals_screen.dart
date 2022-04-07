import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../widgets/platform_widgets/platform_bar.dart';
import '../widgets/platform_widgets/platform_scaffold.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
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
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    var bar = Platform.isIOS
        ? PlatformBar.cupAppBar(Text(categoryTitle!),
            backgroundColor: Theme.of(context).primaryColor)
        : PlatformBar.matAppBar(Text(categoryTitle!),
            backgroundColor: Theme.of(context).primaryColor);
    return PlatformScaffold(
      platformBar: bar,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

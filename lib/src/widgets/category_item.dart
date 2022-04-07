import 'dart:io';

import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    // var route = Platform.isIOS
    //     ? PlatformPageRoute.cupPage(
    //         ctx,
    //         CategoryMealsScreen(
    //           categoryId: id,
    //           categoryTitle: title,
    //         ),
    //       )
    //     : PlatformPageRoute.matPage(
    //         ctx,
    //         CategoryMealsScreen(
    //           categoryId: id,
    //           categoryTitle: title,
    //         ),
    //       );
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: () => selectCategory(context),
            child: _renderContents(context),
          )
        : InkWell(
            onTap: () => selectCategory(context),
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
            child: _renderContents(context),
          );
  }

  Container _renderContents(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

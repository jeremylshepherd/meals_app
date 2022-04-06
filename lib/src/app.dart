import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/category_meals_screen.dart';
import 'package:meals_app/src/widgets/platform_widgets/platform_app.dart';
import './screens/categories_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  ThemeData theme() => ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.orangeAccent,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      );

  @override
  Widget build(BuildContext context) {
    return _crossPlatformApp();
  }

  Widget _materialApp() {
    return MaterialApp(
      theme: theme(),
      home: const Scaffold(
        body: CategoriesScreen(),
      ),
      // initialRoute: '/',
      routes: {
        '/categories-meals': (ctx) => const CategoryMealsScreen(),
      },
    );
  }

  Widget _crossPlatformApp() {
    return PlatformApp(
      cTheme: MaterialBasedCupertinoThemeData(materialTheme: theme()),
      mTheme: theme(),
      home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/categories-meals': (ctx) => CategoryMealsScreen(),
      },
    );
  }

  Widget _iosApp() {
    return CupertinoApp(
      home: const CategoriesScreen(),
      theme: MaterialBasedCupertinoThemeData(materialTheme: theme()),
      initialRoute: '/',
      routes: {
        '/categories-meals': (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}

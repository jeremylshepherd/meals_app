import 'dart:io';

import 'package:flutter/material.dart';
import '../widgets/overlay_image.dart';
import '../widgets/platform_widgets/platform_bar.dart';
import '../widgets/platform_widgets/platform_scaffold.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    Meal meal = routeArgs['meal'];

    var boxDecoration = BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(100, 100, 100, 0.4),
        ),
        borderRadius: BorderRadius.circular(10));
    return PlatformScaffold(
      platformBar: Platform.isIOS
          ? PlatformBar.cupAppBar(
              Text(meal.title),
              backgroundColor: Theme.of(context).primaryColor,
            )
          : PlatformBar.matAppBar(
              Text(meal.title),
              backgroundColor: Theme.of(context).primaryColor,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OverlayImage(
              meal: meal,
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoBarIcon(Icons.schedule, '${meal.duration} minutes'),
                _buildInfoBarIcon(
                    Icons.schedule, meal.complexity.toString().split('.').last),
                _buildInfoBarIcon(Icons.attach_money,
                    meal.affordability.toString().split('.').last),
              ],
            ),
            _buildHeading('Ingredients'),
            _buildListContainer(
                boxDecoration: boxDecoration,
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 6,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              meal.ingredients[index],
                              softWrap: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: meal.ingredients.length,
                )),
            _buildHeading('Directions'),
            _buildListContainer(
                boxDecoration: boxDecoration,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: FittedBox(
                              child: Text('${index + 1}'),
                            ),
                          ),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider()
                    ],
                  ),
                  itemCount: meal.steps.length,
                )),
          ],
        ),
      ),
    );
  }

  Container _buildListContainer(
      {required BoxDecoration boxDecoration, required Widget child}) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(5),
      decoration: boxDecoration,
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }

  Padding _buildHeading(String label, {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }

  Expanded _buildInfoBarIcon(IconData icon, String label) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.schedule),
          const SizedBox(
            width: 3,
          ),
          Text(label),
        ],
      ),
    );
  }
}

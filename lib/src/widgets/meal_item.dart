import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';
import 'platform_widgets/xInkWell.dart';
import '../widgets/overlay_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({Key? key, required this.meal}) : super(key: key);

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.moderate:
        return 'Moderate';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'Unspecified';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.moderate:
        return 'Moderate';
      case Affordability.expensive:
        return 'Expensive';
      default:
        return 'Unspecified';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: {'meal': meal});
  }

  @override
  Widget build(BuildContext context) {
    return xInkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            OverlayImage(meal: meal),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} minutes')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_outlined,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () => selectMeal(context),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/meal.dart';

class OverlayImage extends StatelessWidget {
  const OverlayImage({
    Key? key,
    required this.meal,
    this.height,
  }) : super(key: key);

  final Meal meal;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Image.network(
            meal.imageUrl,
            height: height ?? 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black54,
                  Color.fromRGBO(0, 0, 0, 0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 20,
            ),
            width: 220,
            child: Text(
              meal.title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

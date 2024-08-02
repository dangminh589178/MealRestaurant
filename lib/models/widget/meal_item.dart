import 'package:demoflutter/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectMealDetail});
  final void Function(Meal meal) selectMealDetail;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
            selectMealDetail(meal);
        },
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, image: meal.imageUrl),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(166, 0, 0, 0)
                  ),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Text(meal.title),                    
                  ],),
                ))
          ],
        ),
      ),
    );
  }
}

// FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: meal.imageUrl

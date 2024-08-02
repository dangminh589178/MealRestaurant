import 'package:demoflutter/models/meal.dart';
import 'package:demoflutter/models/widget/meal_item_detail.dart';
import 'package:demoflutter/models/widget/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals});
  final String title;
  final List<Meal> meals;

  void selectCategory(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealItemDetail(
   
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(children: [
        Text(
          "Uh oh ... nothing here",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        SizedBox(
          height: 16,
        ),
        Text(("Try select another meals"))
      ]),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                selectMealDetail: (meal) {
                  selectCategory(context, meal);
                },
              ));
    }

    return Scaffold(
      appBar: (title == "Favorites")
          ? null
          : AppBar(
              title: Text(title),
            ),
      body: content,
    );
  }
}

import 'package:demoflutter/models/data/dummy_data.dart';
import 'package:demoflutter/models/meal.dart';
import 'package:demoflutter/models/screen/meal_screen.dart';
import 'package:demoflutter/models/widget/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.mealFilters});
  final List<Meal> mealFilters;

  void selectCategory(BuildContext context, String category, String title) {
    print("listreceive: ${mealFilters.length} ");
    var listSort = List.of(mealFilters); //impl list favorite
    var result =
        listSort.where((e) => e.categories.contains(category)).toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: title, meals: result)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (var item in availableCategories)
          CategoryGridItem(
            category: item,
            onClickCategory: () {
              selectCategory(context, item.id, item.title);
            },
          )
      ],
    ));
  }
}

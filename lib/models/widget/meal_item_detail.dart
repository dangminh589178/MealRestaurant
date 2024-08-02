import 'package:demoflutter/models/meal.dart';
import 'package:demoflutter/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetail extends ConsumerWidget {
  const MealItemDetail({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listFavorite = ref.watch(FavoriteMealNotifier.providerMeals);
    var isFavorite = listFavorite.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isFavorited = ref
                  .read(FavoriteMealNotifier.providerMeals.notifier)
                  .addMealFavorite(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: (isFavorited)
                      ? const Text("Meal added")
                      : const Text("Meal removed"),
                ),
              );
            },
            icon: Icon(isFavorite ? Icons.favorite: Icons.unarchive),
          )
        ],
      ),
      body: Column(
        children: [
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, image: meal.imageUrl)
        ],
      ),
    );
  }
}

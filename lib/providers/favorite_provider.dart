import 'package:demoflutter/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);
  static final providerMeals =
      StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
    return FavoriteMealNotifier();
  });

  bool addMealFavorite(Meal meal) {
    final favoriteMeal = state.contains(meal);
    if (favoriteMeal) {
      state = state.where((e) => e.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

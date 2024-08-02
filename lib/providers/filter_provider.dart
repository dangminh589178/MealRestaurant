import 'package:demoflutter/models/screen/filter_screen.dart';
import 'package:demoflutter/providers/meal_provides.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterNotifer extends StateNotifier<Map<Filter, bool>> {
  FilterNotifer()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  setMapFilter(Map<Filter, bool> filter) {
    state = filter;
  }

  static final filterProvider =
      StateNotifierProvider<FilterNotifer, Map<Filter, bool>>((ref) {
    return FilterNotifer();
  });
}

final filterProvider = Provider((ref) {
  final mealDummy = ref.watch(mealsProviders);
  final mealProvider = ref.watch(FilterNotifer.filterProvider);
  return  mealDummy.where((e){
      return mealProvider[Filter.glutenFree] == e.isGlutenFree &&
          mealProvider[Filter.lactoseFree] == e.isLactoseFree &&
          mealProvider[Filter.vegetarian] == e.isVegetarian &&
          mealProvider[Filter.vegan] == e.isVegan;
    }).toList();
});

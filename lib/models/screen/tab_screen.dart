import 'package:demoflutter/models/meal.dart';
import 'package:demoflutter/models/screen/categories_screen.dart';
import 'package:demoflutter/models/screen/filter_screen.dart';
import 'package:demoflutter/models/screen/meal_screen.dart';
import 'package:demoflutter/models/widget/main_drawer.dart';
import 'package:demoflutter/providers/favorite_provider.dart';
import 'package:demoflutter/providers/filter_provider.dart';
import 'package:demoflutter/providers/meal_provides.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const KInits = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreen();
}

class _TabScreen extends ConsumerState<TabScreen> {
  // final GlobalKey<ScaffoldState> _key =  GlobalKey<ScaffoldState>();
  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  int selectIndex = 0;
  var titleTab = "";
  List<Meal> mealFavorite = [];
  List<Meal> mealFilters = [];

  void selectIndexPage(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void favoriteReceiveMeal(Meal meal) {
    setState(() {
      if (!mealFavorite.contains(meal)) {
        mealFavorite.add(meal);
        showMessage("Favorite");
      } else {
        mealFavorite.remove(meal);
        showMessage("Unfavorite");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("BuildTabScreen");
    // final meals = ref.watch(mealsProviders);
    // final mealsFilterProvider = ref.watch(FilterNotifer.filterProvider);
    // var resultFilters = meals.where((e) {
    //   return mealsFilterProvider[Filter.glutenFree] == e.isGlutenFree &&
    //       mealsFilterProvider[Filter.lactoseFree] == e.isLactoseFree &&
    //       mealsFilterProvider[Filter.vegetarian] == e.isVegetarian &&
    //       mealsFilterProvider[Filter.vegan] == e.isVegan;
    // }).toList();
    final mealFilter = ref.watch(filterProvider);
    setState(() {
      mealFilters = mealFilter;
    });
    Widget content = CategoriesScreen(
      mealFilters: mealFilters,
    );
    if (selectIndex == 1) {
      final favoriteMEal = ref.watch(FavoriteMealNotifier.providerMeals);

      content = MealsScreen(
        title: "Favorites",
        meals: favoriteMEal,
      );
      titleTab = "My favories";
    } else {
      titleTab = "Pick your categories";
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(titleTab),
          leading: Builder(builder: (ctx) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(ctx).openDrawer();
                },
                icon: Icon(Icons.category_sharp));
          }),
        ),
        body: content,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: selectIndexPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
          ],
        ),
        drawer: MainDrawer(
          naviFilter: selectFilter,
        ));
  }

  void selectFilter(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "filter") {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => Filterscreen(),
        ),
      );
    }
  }
}

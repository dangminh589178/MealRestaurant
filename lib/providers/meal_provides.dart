import 'package:demoflutter/models/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProviders = Provider((ref) {
  return dummyMeals;
});

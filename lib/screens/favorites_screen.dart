import 'package:flutter/material.dart';
import 'package:meals_app_flutter/models/meal.dart';

import '../widgets/meal_item.dart';

// ignore: must_be_immutable
class FavoritesScreen extends StatelessWidget {
  List<Meal> favoriteMeal;
  FavoritesScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers

    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorites - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageURL: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability);
          // Text(categoryMeals[index].title);
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}

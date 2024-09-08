import 'package:flutter/material.dart';
import 'package:mealapp/meal_item.dart';
import 'package:mealapp/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites Try adding Some'),
      );
    } else {
      return ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            id: favouriteMeals[index].id);
      });
    }
  }
}

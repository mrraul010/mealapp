import 'package:flutter/material.dart';
import 'package:mealapp/meal_item.dart';
import 'package:mealapp/models/meal.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;
  const CategoryMeal(this.availableMeals, {super.key});

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;
  // final String categoryId;
  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id']!;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 214, 255),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

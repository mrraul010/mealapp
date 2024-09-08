import 'package:flutter/material.dart';
import 'package:mealapp/category_item.dart';
import './models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2, // Adjust aspect ratio as needed
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (catdata) => CategoryItem(
                  id: catdata.id,
                  title: catdata.title,
                  color: catdata.color,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

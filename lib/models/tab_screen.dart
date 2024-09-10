import 'package:flutter/material.dart';
import 'package:mealapp/categories_screen.dart';
import 'package:mealapp/models/favorites_screen.dart';
import 'package:mealapp/models/main_drawer.dart';
import 'package:mealapp/models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  const TabScreen(this.favouriteMeals, {super.key});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'] as String,
        ),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              icon: Icon(Icons.heart_broken),
              label: 'Favourites'),
        ],
        selectedItemColor: const Color.fromARGB(255, 68, 214, 255),
        unselectedItemColor: const Color.fromARGB(123, 123, 123, 100),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.icon, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Weapons',
        icon: 'assets/icons/Categories/Weapons.svg',
        boxColor: Colors.red));

    categories.add(CategoryModel(
        name: 'Armors',
        icon: 'assets/icons/Categories/Armors.svg',
        boxColor: Colors.green));

    categories.add(CategoryModel(
        name: 'Combos',
        icon: 'assets/icons/Categories/Combos.svg',
        boxColor: Colors.blue));

    categories.add(CategoryModel(
        name: 'Items',
        icon: 'assets/icons/Categories/Items.svg',
        boxColor: Colors.yellow));

    categories.add(CategoryModel(
        name: 'Monsters',
        icon: 'assets/icons/Categories/Monsters.svg',
        boxColor: Colors.grey));

    categories.add(CategoryModel(
        name: 'Ammos',
        icon: 'assets/icons/Categories/Ammos.svg',
        boxColor: Colors.lightBlue));

    categories.add(CategoryModel(
        name: 'Maps',
        icon: 'assets/icons/Categories/Maps.svg',
        boxColor: Colors.tealAccent));

    return categories;
  }
}

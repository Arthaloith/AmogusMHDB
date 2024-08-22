import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String icon;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.icon, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> Categories = [];

    Categories.add(CategoryModel(
        name: 'Weapons',
        icon: 'assets/icons/Categories/Weapons.svg',
        boxColor: Colors.red));

    Categories.add(CategoryModel(
        name: 'Armors',
        icon: 'assets/icons/Categories/Armors.svg',
        boxColor: Colors.green));

    Categories.add(CategoryModel(
        name: 'Combos',
        icon: 'assets/icons/Categories/Combos.svg',
        boxColor: Colors.blue));

    Categories.add(CategoryModel(
        name: 'Items',
        icon: 'assets/icons/Categories/Items.svg',
        boxColor: Colors.yellow));

    Categories.add(CategoryModel(
        name: 'Monsters',
        icon: 'assets/icons/Categories/Monsters.svg',
        boxColor: Colors.grey));

    Categories.add(CategoryModel(
        name: 'Ammos',
        icon: 'assets/icons/Categories/Ammos.svg',
        boxColor: Colors.lightBlue));

    Categories.add(CategoryModel(
        name: 'Maps',
        icon: 'assets/icons/Categories/Maps.svg',
        boxColor: Colors.tealAccent));

    return Categories;
  }
}

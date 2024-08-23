import 'package:flutter/material.dart';

class ArmorTypeModel {
  String name;
  String icon;
  Color boxColor;

  ArmorTypeModel(
      {required this.name, required this.icon, this.boxColor = Colors.white});

  static List<ArmorTypeModel> getArmorTypeModel() {
    List<ArmorTypeModel> armorTypes = [];

    armorTypes.add(ArmorTypeModel(
      name: 'LR Blademaster',
      icon: 'assets/icons/ArmorType/Head.svg',
    ));

    armorTypes.add(ArmorTypeModel(
      name: 'HR Blademaster',
      icon: 'assets/icons/ArmorType/Chest.svg',
    ));

    armorTypes.add(ArmorTypeModel(
      name: 'LR Gunner',
      icon: 'assets/icons/ArmorType/Arms.svg',
    ));

    armorTypes.add(ArmorTypeModel(
      name: 'HR Gunner',
      icon: 'assets/icons/ArmorType/Waist.svg',
    ));

    armorTypes.add(ArmorTypeModel(
      name: 'Other',
      icon: 'assets/icons/ArmorType/Legs.svg',
    ));

    return armorTypes;
  }
}

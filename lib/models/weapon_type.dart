import 'package:flutter/material.dart';

class WeaponTypeModel {
  String name;
  String icon;
  Color boxColor;

  WeaponTypeModel(
      {required this.name, required this.icon, this.boxColor = Colors.white});

  static List<WeaponTypeModel> getWeaponTypeModel() {
    List<WeaponTypeModel> weaponTypes = [];

    weaponTypes.add(WeaponTypeModel(
      name: 'Great Sword',
      icon: 'assets/icons/WeapType/GS.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Long Sword',
      icon: 'assets/icons/WeapType/LS.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Sword and Shield',
      icon: 'assets/icons/WeapType/SNS.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Dual Blades',
      icon: 'assets/icons/WeapType/DB.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Lance',
      icon: 'assets/icons/WeapType/LN.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Gunlance',
      icon: 'assets/icons/WeapType/GL.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Hammer',
      icon: 'assets/icons/WeapType/HM.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Hunting Horn',
      icon: 'assets/icons/WeapType/HH.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Switch Axe',
      icon: 'assets/icons/WeapType/SA.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Charge Blade',
      icon: 'assets/icons/WeapType/CB.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Insect Glaive',
      icon: 'assets/icons/Categories/Weapons.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Light Bowgun',
      icon: 'assets/icons/WeapType/LBG.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Heavy Bowgun',
      icon: 'assets/icons/WeapType/HBG.svg',
    ));

    weaponTypes.add(WeaponTypeModel(
      name: 'Bow',
      icon: 'assets/icons/WeapType/BW.svg',
    ));

    return weaponTypes;
  }
}

import 'package:flutter/material.dart';

class AmmoTypeModel {
  String name;
  String icon;
  Color boxColor;

  AmmoTypeModel(
      {required this.name, required this.icon, this.boxColor = Colors.white});

  static List<AmmoTypeModel> getAmmoTypeModel() {
    List<AmmoTypeModel> ammoTypes = [];

    ammoTypes.add(AmmoTypeModel(
      name: 'Attack',
      icon: 'assets/icons/WeapType/GS.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Elemental',
      icon: 'assets/icons/WeapType/LS.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Status-Affliction',
      icon: 'assets/icons/WeapType/SNS.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Support',
      icon: 'assets/icons/WeapType/DB.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Fortress',
      icon: 'assets/icons/WeapType/LN.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Bow Coating',
      icon: 'assets/icons/WeapType/GL.svg',
    ));

    return ammoTypes;
  }
}

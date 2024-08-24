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
      icon: 'assets/icons/AmmoType/attack.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Elemental',
      icon: 'assets/icons/AmmoType/elemental.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Status-Affliction',
      icon: 'assets/icons/AmmoType/status_affliction.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Support',
      icon: 'assets/icons/AmmoType/support.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Fortress',
      icon: 'assets/icons/AmmoType/fortress.svg',
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Bow Coating',
      icon: 'assets/icons/AmmoType/coating.svg',
    ));

    return ammoTypes;
  }
}

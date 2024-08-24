import 'package:flutter/material.dart';

class AmmoTypeModel {
  String name;
  String icon;
  Color boxColor;

  AmmoTypeModel(
      {required this.name, required this.icon, required this.boxColor});

  static List<AmmoTypeModel> getAmmoTypeModel() {
    List<AmmoTypeModel> ammoTypes = [];

    ammoTypes.add(AmmoTypeModel(
      name: 'Attack',
      icon: 'assets/icons/AmmoType/attack.svg',
      boxColor: const Color.fromARGB(255, 131, 243, 139),
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Elemental',
      icon: 'assets/icons/AmmoType/elemental.svg',
      boxColor: Colors.lightBlue,
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Status-Affliction',
      icon: 'assets/icons/AmmoType/status_affliction.svg',
      boxColor: Colors.purple,
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Support',
      icon: 'assets/icons/AmmoType/support.svg',
      boxColor: Colors.green,
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Fortress',
      icon: 'assets/icons/AmmoType/fortress.svg',
      boxColor: Colors.grey,
    ));

    ammoTypes.add(AmmoTypeModel(
      name: 'Bow Coating',
      icon: 'assets/icons/AmmoType/coating.svg',
      boxColor: const Color.fromARGB(255, 242, 119, 119),
    ));

    return ammoTypes;
  }
}

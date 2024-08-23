import 'package:flutter/material.dart';

class MonsterTypeModel {
  String name;
  String icon;
  Color boxColor;

  MonsterTypeModel(
      {required this.name, required this.icon, this.boxColor = Colors.white});

  static List<MonsterTypeModel> getMonsterTypeModel() {
    List<MonsterTypeModel> monsterTypes = [];

    monsterTypes.add(MonsterTypeModel(
      name: 'Lynian',
      icon: 'assets/icons/WeapType/GS.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Herbivore',
      icon: 'assets/icons/WeapType/LS.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Fish',
      icon: 'assets/icons/WeapType/SNS.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Wingdrake',
      icon: 'assets/icons/WeapType/DB.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Neopteron',
      icon: 'assets/icons/WeapType/LN.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Temnoceran',
      icon: 'assets/icons/WeapType/GL.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Bird Wyvern',
      icon: 'assets/icons/WeapType/HM.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Hunting Horn',
      icon: 'assets/icons/WeapType/HH.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Flying Wyvern',
      icon: 'assets/icons/WeapType/SA.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Piscine Wyvern',
      icon: 'assets/icons/WeapType/CB.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Carapaceon',
      icon: 'assets/icons/Categories/Weapons.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Amphibian',
      icon: 'assets/icons/WeapType/LBG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Fanged Beast',
      icon: 'assets/icons/WeapType/HBG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Leviathan',
      icon: 'assets/icons/WeapType/BW.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Snake Wyvern',
      icon: 'assets/icons/WeapType/IG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Brute Wyvern',
      icon: 'assets/icons/WeapType/IG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Fanged Wyvern',
      icon: 'assets/icons/WeapType/IG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Elder Dragon',
      icon: 'assets/icons/WeapType/IG.svg',
    ));

    monsterTypes.add(MonsterTypeModel(
      name: 'Unknown',
      icon: 'assets/icons/WeapType/IG.svg',
    ));
    return monsterTypes;
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class WeapModel {
  String name;
  String icon;
  int atk;
  int rarity;
  String sharpness_r;
  String sharpness_o;
  String sharpness_y;
  String sharpness_g;
  String sharpness_b;
  String sharpness_w;
  String type;
  Color boxColor;
  bool viewIsSelected;

  WeapModel({
    required this.name,
    required this.icon,
    required this.atk,
    required this.rarity,
    required this.sharpness_r,
    required this.sharpness_o,
    required this.sharpness_y,
    required this.sharpness_g,
    required this.sharpness_b,
    required this.sharpness_w,
    required this.type,
    this.boxColor = const Color.fromRGBO(0, 0, 0, 1), // default black color
    required this.viewIsSelected,
  }) {
    if (boxColor == const Color.fromRGBO(0, 0, 0, 1)) {
      boxColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    }
  }
  static List<WeapModel> getWeaps() {
    List<WeapModel> weaps = [];

    weaps.add(WeapModel(
        name: 'Dummy Katana',
        icon: 'assets/icons/WeapRank/Long_Sword/Long_Sword_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Long Sword',
        viewIsSelected: true));

    weaps.add(WeapModel(
        name: 'Dummy Slashers',
        icon: 'assets/icons/WeapRank/Dual_Blades/Dual_Blades_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Dual Blade',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Quarterstaff',
        icon: 'assets/icons/WeapRank/Sword_&_Shield/Sword_&_Shield_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Sword & Shield',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Cannon',
        icon: 'assets/icons/WeapRank/Gunlance/Gunlance_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Gunlance',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Spike',
        icon: 'assets/icons/WeapRank/Lance/Lance_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Lance',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Guitar',
        icon: 'assets/icons/WeapRank/Hunting_Horn/Hunting_Horn_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Hunting Horn',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Sickle',
        icon: 'assets/icons/WeapRank/Switch_Axe/Switch_Axe_Rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Switch Axe',
        viewIsSelected: false));

    weaps.add(WeapModel(
        name: 'Dummy Blade',
        icon: 'assets/icons/WeapRank/Charge_Blade/Charge_Blade_rank_07.svg',
        atk: 170,
        rarity: 7,
        sharpness_r: 'assets/icons/WeapSharp/red.svg',
        sharpness_o: 'assets/icons/WeapSharp/orange.svg',
        sharpness_y: 'assets/icons/WeapSharp/yellow.svg',
        sharpness_g: 'assets/icons/WeapSharp/green.svg',
        sharpness_b: 'assets/icons/WeapSharp/blue.svg',
        sharpness_w: 'assets/icons/WeapSharp/white.svg',
        type: 'Charge Blade',
        viewIsSelected: false));

    return weaps;
  }
}

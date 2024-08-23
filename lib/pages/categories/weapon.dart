import 'package:amogus/models/weapon_type.dart';
import 'package:amogus/pages/weapons/BW/bow.dart';
import 'package:amogus/pages/weapons/CB/charge_blade.dart';
import 'package:amogus/pages/weapons/DB/dual_blades.dart';
import 'package:amogus/pages/weapons/GL/gun_lance.dart';
import 'package:amogus/pages/weapons/GS/great_sword.dart';
import 'package:amogus/pages/weapons/HBG/heavy_bow_gun.dart';
import 'package:amogus/pages/weapons/HH/hunting_horn.dart';
import 'package:amogus/pages/weapons/HM/hammer.dart';
import 'package:amogus/pages/weapons/IG/insect_glaive.dart';
import 'package:amogus/pages/weapons/LBG/light_bow_gun.dart';
import 'package:amogus/pages/weapons/LN/lance.dart';
import 'package:amogus/pages/weapons/LS/long_sword.dart';
import 'package:amogus/pages/weapons/SA/switch_axe.dart';
import 'package:amogus/pages/weapons/SNS/sword_and_shield.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage> {
  List<WeaponTypeModel> weaponTypes = [];

  void _getInitialInfo() {
    weaponTypes = WeaponTypeModel.getWeaponTypeModel();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
          appBar: customAppBar(context, 'Weapon DB'),
          body: Center(
            child: weaponCategories(context),
          ));
    });
  }

  Column weaponCategories(BuildContext context) {
    final pageMap = {
      0: const BowPage(),
      1: const ChargeBladePage(),
      2: const DualBladePage(),
      3: const GunLancePage(),
      4: const GreatSwordPage(),
      5: const HeavyBowGunPage(),
      6: const HuntingHornPage(),
      7: const HammerPage(),
      8: const InsectGlaivePage(),
      9: const LightBowGunPage(),
      10: const LancePage(),
      11: const LongSwordPage(),
      12: const SwitchAxePage(),
      13: const SwordAndShieldPage()
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Categories',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 120,
            child: ListView.separated(
              itemCount: WeaponTypeModel.getWeaponTypeModel().length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pageMap[index]!),
                    );
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: WeaponTypeModel.getWeaponTypeModel()[index]
                          .boxColor
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(weaponTypes[index].icon),
                          ),
                        ),
                        Text(
                          weaponTypes[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}

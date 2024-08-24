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
import 'package:amogus/ui/right_drawer.dart';
import 'package:amogus/ui/search_field.dart';

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
          endDrawer: rightDrawer(context),
          body: SingleChildScrollView(
            child: Theme(
                data: themeProvider.theme,
                child: Column(children: [
                  const SearchField(),
                  const SizedBox(height: 30),
                  fadingLine(),
                  const SizedBox(height: 5),
                  weaponCategories(context),
                  const SizedBox(height: 10),
                  fadingLine(),
                  const SizedBox(height: 30),
                  faqIsLove(),
                  const SizedBox(height: 30),
                ])),
          ));
    });
  }

  Container fadingLine() {
    return Container(
      height: 1, // adjust the height to your liking
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0, 0.5, 12],
          colors: [
            Colors.transparent,
            Colors.grey, // adjust the color to your liking
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  Column faqIsLove() {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'FAQ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('What is the best weapon for a beginner?'),
              children: [
                Text(
                  'The best weapon for a beginner is often subjective and depends on personal playstyle. However, the Great Sword is a popular choice for its ease of use and high damage output.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('How do I upgrade my weapon?'),
              children: [
                Text(
                  'To upgrade your weapon, you will need to gather materials and visit the Smithy. The Smithy can be found in the game\'s hub area.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text(
                  'What is the difference between a Great Sword and a Long Sword?'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'The Great Sword is a slower, more powerful weapon, while the Long Sword is faster and more agile. The choice between the two ultimately comes down to personal preference.',
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  Column weaponCategories(BuildContext context) {
    final pageMap = {
      0: const GreatSwordPage(),
      1: const LongSwordPage(),
      2: const SwordAndShieldPage(),
      3: const DualBladesPage(),
      4: const LancePage(),
      5: const GunlancePage(),
      6: const HammerPage(),
      7: const HuntingHornPage(),
      8: const SwitchAxePage(),
      9: const ChargeBladePage(),
      10: const InsectGlaivePage(),
      11: const LightBowGunPage(),
      12: const HeavyBowGunPage(),
      13: const BowPage()
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Weapon Types',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            '(scroll to reveal more)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w200,
                fontSize: 12), // You can adjust the style as needed
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 240, // Increase the height to accommodate two rows
          child: GridView.count(
            crossAxisCount: 2, // Two columns
            childAspectRatio: 1.0, // Square-shaped icons
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            children: List.generate(
              WeaponTypeModel.getWeaponTypeModel().length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => pageMap[index]!),
                    );
                  },
                  child: Container(
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
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

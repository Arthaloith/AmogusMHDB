import 'package:amogus/models/ammo_type.dart';
import 'package:amogus/pages/ammos/attack.dart';
import 'package:amogus/pages/ammos/bow_coating.dart';
import 'package:amogus/pages/ammos/elemental.dart';
import 'package:amogus/pages/ammos/fortress.dart';
import 'package:amogus/pages/ammos/status_affliction.dart';
import 'package:amogus/pages/ammos/support.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:amogus/ui/search_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AmmosPage extends StatefulWidget {
  const AmmosPage({super.key});

  @override
  State<AmmosPage> createState() => _AmmosPageState();
}

class _AmmosPageState extends State<AmmosPage> {
  List<AmmoTypeModel> ammoTypes = [];

  void _getInitialInfo() {
    ammoTypes = AmmoTypeModel.getAmmoTypeModel();
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
                  ammoCaterogories(context),
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
              title: Text(
                  'What is the difference between Attack Ammo and Elemental Ammo?'),
              children: [
                Text(
                  'Attack Ammo deals physical damage to monsters, while Elemental Ammo deals elemental damage (fire, water, thunder, etc.) that can exploit a monster\'s weaknesses.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('How do I use Status Affliction Ammo effectively?'),
              children: [
                Text(
                  'Status Affliction Ammo can inflict status effects like paralysis, sleep, or stun on monsters. Use it to immobilize a monster and make it easier to attack or capture.',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ExpansionTile(
              title: Text('What is the purpose of Support Ammo?'),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'Support Ammo provides various benefits to the hunter, such as increased health, stamina, or damage output. Use it to gain an advantage in combat or to support your allies.',
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  Column ammoCaterogories(BuildContext context) {
    final pageMap = {
      0: const AttackAmmoPage(),
      1: const ElementalAmmoPage(),
      2: const StatusAfflictionAmmoPage(),
      3: const SupportAmmoPage(),
      4: const FortressAmmoPage(),
      5: const CoatingPage(),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Ammo Types',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0),
          child: Text(
            '(don\'t scroll to reveal more)',
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
              AmmoTypeModel.getAmmoTypeModel().length,
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
                      color: AmmoTypeModel.getAmmoTypeModel()[index]
                          .boxColor
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(ammoTypes[index].icon),
                            ),
                          ),
                        ),
                        Text(
                          ammoTypes[index].name,
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

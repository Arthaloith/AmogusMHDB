import 'package:amogus/models/armor_type.dart';
import 'package:amogus/pages/armors/lr_blademaster.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../ui/search_field.dart';

class ArmorsPage extends StatefulWidget {
  const ArmorsPage({super.key});

  @override
  State<ArmorsPage> createState() => _ArmorsPageState();
}

class _ArmorsPageState extends State<ArmorsPage> {
  List<ArmorTypeModel> armors = [];

  void _getInitialInfo() {
    // Replace with your actual data fetching logic
    armors = ArmorTypeModel.getArmorTypeModel();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
          appBar: customAppBar(context, 'Armor DB'),
          body: Theme(
              data: themeProvider.theme,
              child: Column(children: [
                SearchField(),
                SizedBox(height: 30),
                armorCategories(context),
              ])));
    });
  }

  Column armorCategories(BuildContext context) {
    final pageMap = {
      0: LowRankBlademasterPage(),
      // 1: const ChargeBladePage(),
      // 2: const DualBladePage(),
      // 3: const GunLancePage(),
      // 4: const GreatSwordPage(),
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
          height: 240, // Increase the height to accommodate two rows
          child: GridView.count(
            crossAxisCount: 2, // Two columns
            childAspectRatio: 1.0, // Square-shaped icons
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            crossAxisSpacing: 25,
            mainAxisSpacing: 20,
            children: List.generate(
              ArmorTypeModel.getArmorTypeModel().length,
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
                      color: ArmorTypeModel.getArmorTypeModel()[index]
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
                            child: SvgPicture.asset(armors[index].icon),
                          ),
                        ),
                        Text(
                          armors[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
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

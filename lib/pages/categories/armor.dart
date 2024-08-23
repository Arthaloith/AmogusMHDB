import 'package:amogus/models/armor_type.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
          body: Center(
            child: armorCategories(context),
          ));
    });
  }

  Column armorCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Armors',
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
              itemCount: armors.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: armors[index].boxColor.withOpacity(0.3),
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

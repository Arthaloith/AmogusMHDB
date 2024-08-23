import 'package:amogus/models/ammo_type.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
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
          appBar: customAppBar(context, 'Ammo DB'),
          body: Center(
            child: ammoCategories(context),
          ));
    });
  }

  Column ammoCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Ammos',
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
              itemCount: AmmoTypeModel.getAmmoTypeModel().length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: AmmoTypeModel.getAmmoTypeModel()[index]
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
                            child: SvgPicture.asset(ammoTypes[index].icon),
                          ),
                        ),
                        Text(
                          ammoTypes[index].name,
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

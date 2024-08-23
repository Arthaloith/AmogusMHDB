import 'package:amogus/models/monster_type.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MonstersPage extends StatefulWidget {
  const MonstersPage({super.key});

  @override
  State<MonstersPage> createState() => _MonsterPageState();
}

class _MonsterPageState extends State<MonstersPage> {
  List<MonsterTypeModel> monsterTypes = [];

  void _getInitialInfo() {
    monsterTypes = MonsterTypeModel.getMonsterTypeModel();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
          appBar: customAppBar(context, 'Monster DB'),
          body: Center(
            child: monsterCategories(context),
          ));
    });
  }

  Column monsterCategories(BuildContext context) {
    // final pageMap = {
    //   0: const MonsterDetailPage(),
    //   1: const MonsterDetailPage(),
    //   2: const MonsterDetailPage(),
    //   // Add more monster detail pages as needed
    // };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Monsters',
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
              itemCount: MonsterTypeModel.getMonsterTypeModel().length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 25),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: MonsterTypeModel.getMonsterTypeModel()[index]
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
                            child: SvgPicture.asset(monsterTypes[index].icon),
                          ),
                        ),
                        Text(
                          monsterTypes[index].name,
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

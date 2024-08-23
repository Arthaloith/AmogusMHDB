import 'package:amogus/models/category.dart';
import 'package:amogus/models/weapon.dart';
import 'package:amogus/pages/categories/ammo.dart';
import 'package:amogus/pages/categories/armor.dart';
import 'package:amogus/pages/categories/combo.dart';
import 'package:amogus/pages/categories/item.dart';
import 'package:amogus/pages/categories/map.dart';
import 'package:amogus/pages/categories/monster.dart';
import 'package:amogus/pages/categories/weapon.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/left_drawer.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:amogus/ui/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<WeapModel> weaps = [];

  void _getInitialInfo() {
    categories = CategoryModel.getCategories();
    weaps = WeapModel.getWeaps();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
          appBar: customAppBar(context, "Amogus's MonHun DB", isHome: true),
          endDrawer: rightDrawer(context),
          drawer: leftDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SearchField(),
              const SizedBox(height: 30),
              _categoriesSection(),
              const SizedBox(height: 30),
              _weaponsSection()
            ]),
          ));
    });
  }

  Column _weaponsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Recommended sections',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: 240,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                      width: 210,
                      decoration: BoxDecoration(
                        color: weaps[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            weaps[index].icon,
                          ),
                          Column(
                            children: [
                              Text(
                                weaps[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 1, bottom: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(weaps[index].sharpnessR),
                                    SvgPicture.asset(weaps[index].sharpnessO),
                                    SvgPicture.asset(weaps[index].sharpnessY),
                                    SvgPicture.asset(weaps[index].sharpnessG),
                                    SvgPicture.asset(weaps[index].sharpnessB),
                                    SvgPicture.asset(weaps[index].sharpnessW),
                                  ],
                                ),
                              ),
                              Text(
                                  '${weaps[index].rarity}★ | ${weaps[index].atk} ATK',
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Container(
                            width: 130,
                            height: 45,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  weaps[index].viewIsSelected
                                      ? const Color(0xff9DCEFF)
                                      : Colors.transparent,
                                  weaps[index].viewIsSelected
                                      ? const Color(0xff92A3FD)
                                      : Colors.transparent,
                                ]),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                                child: Text(
                              'View',
                              style: TextStyle(
                                  color: weaps[index].viewIsSelected
                                      ? Colors.white
                                      : const Color(0xffC58BF2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                itemCount: weaps.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20)))
      ],
    );
  }

  Column _categoriesSection() {
    final pageMap = {
      0: const WeaponsPage(),
      1: const ArmorsPage(),
      2: CombosPage(),
      3: const ItemsPage(),
      4: const MonstersPage(),
      5: const AmmosPage(),
      6: const MapsPage()
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
              itemCount: categories.length,
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
                      color: categories[index].boxColor.withOpacity(0.3),
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
                            child: SvgPicture.asset(categories[index].icon),
                          ),
                        ),
                        Text(
                          categories[index].name,
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

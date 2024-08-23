import 'package:amogus/models/category.dart';
import 'package:amogus/models/weapon.dart';
import 'package:amogus/pages/categories/ammo.dart';
import 'package:amogus/pages/categories/armor.dart';
import 'package:amogus/pages/categories/combo.dart';
import 'package:amogus/pages/categories/item.dart';
import 'package:amogus/pages/categories/map.dart';
import 'package:amogus/pages/categories/monster.dart';
import 'package:amogus/pages/categories/weapon.dart';
import 'package:amogus/providers/themeProvider.dart';
import 'package:amogus/ui/leftDrawer.dart';
import 'package:amogus/ui/rightDrawer.dart';
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
          appBar: appBar(context),
          endDrawer: rightDrawer(context),
          drawer: leftDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _searchField(),
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
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Recommended sections',
            style: Theme.of(context).textTheme.bodyLarge,
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
                                    SvgPicture.asset(weaps[index].sharpness_r),
                                    SvgPicture.asset(weaps[index].sharpness_o),
                                    SvgPicture.asset(weaps[index].sharpness_y),
                                    SvgPicture.asset(weaps[index].sharpness_g),
                                    SvgPicture.asset(weaps[index].sharpness_b),
                                    SvgPicture.asset(weaps[index].sharpness_w),
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
      2: const CombosPage(),
      3: const ItemsPage(),
      4: const MonstersPage(),
      5: const AmmosPage(),
      6: const MapsPage()
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.bodyLarge,
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

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.11),
          spreadRadius: 0.0,
          blurRadius: 40,
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: 'Seach something...',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      title: Text("Amogus's MonHun DB",
          style: TextStyle(
            color: themeProvider.currentTheme == AppTheme.light
                ? Colors.white
                : Colors.white,
          )),
      centerTitle: true,
      backgroundColor: themeProvider.currentTheme == AppTheme.light
          ? Colors.blue
          : Colors.black,
      elevation: 0.0,
      // Hide drawer hamburger button
      automaticallyImplyLeading: false,
      // Info button
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/info.svg',
                width: 30, height: 30),
          ),
        );
      }),
      // menu button
      actions: [
        Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: 37,
              decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset('assets/icons/dots.svg',
                  width: 20, height: 20),
            ),
          );
        }),
      ],
    );
  }
}

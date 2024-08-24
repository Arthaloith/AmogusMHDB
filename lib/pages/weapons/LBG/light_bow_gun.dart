import 'package:amogus/pages/weapons/LBG/dummy_lbg.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LightBowGunPage extends StatefulWidget {
  const LightBowGunPage({super.key});

  @override
  State<LightBowGunPage> createState() => _LightBowGunPageState();
}

class _LightBowGunPageState extends State<LightBowGunPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Light Bow Gun Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: lightBowGunList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding lightBowGunList(BuildContext context, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VolgabellPage()),
              );
            },
            child: ListTile(
              title: Text('Volgabell',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                '3 weapons | no fork',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy bow',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 2',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy stock',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 3',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy grip',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 4',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy sight',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 5',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy quiver',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 6',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

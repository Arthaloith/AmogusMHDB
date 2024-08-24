import 'package:amogus/pages/weapons/GS/dummy_gs.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GreatSwordPage extends StatefulWidget {
  const GreatSwordPage({super.key});

  @override
  State<GreatSwordPage> createState() => _GreatSwordPageState();
}

class _GreatSwordPageState extends State<GreatSwordPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Great Sword Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: greatSwordList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding greatSwordList(BuildContext context, ThemeProvider themeProvider) {
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
              title: Text('Dummy sword',
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
              title: Text('Dummy hilt',
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
              title: Text('Dummy blade',
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
              title: Text('Dummy guard',
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
              title: Text('Dummy pommel',
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
          const Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Dummy quillon',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 7',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

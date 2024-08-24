import 'package:amogus/pages/weapons/LS/dummy_ls.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LongSwordPage extends StatefulWidget {
  const LongSwordPage({super.key});

  @override
  State<LongSwordPage> createState() => _LongSwordPageState();
}

class _LongSwordPageState extends State<LongSwordPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Long Sword Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: longSwordList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding longSwordList(BuildContext context, ThemeProvider themeProvider) {
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
              subtitle: const Text('3 weapons | no fork'),
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
              subtitle: const Text('Rare 2'),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          // Add more ListTiles for other dummy swords
        ],
      ),
    );
  }
}

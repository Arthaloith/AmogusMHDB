import 'package:amogus/pages/weapons/HH/dummy_hh.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HuntingHornPage extends StatefulWidget {
  const HuntingHornPage({super.key});

  @override
  State<HuntingHornPage> createState() => _HuntingHornPageState();
}

class _HuntingHornPageState extends State<HuntingHornPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Hunting Horn Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: huntingHornList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding huntingHornList(BuildContext context, ThemeProvider themeProvider) {
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
              title: Text('Dummy HH',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Replace with actual HH data',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

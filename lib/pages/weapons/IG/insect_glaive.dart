import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InsectGlaivePage extends StatefulWidget {
  const InsectGlaivePage({super.key});

  @override
  State<InsectGlaivePage> createState() => _InsectGlaivePageState();
}

class _InsectGlaivePageState extends State<InsectGlaivePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Insect Glaive Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: insectGlaiveList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding insectGlaiveList(BuildContext context, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("MHP3rd doesn't have Insect Glaive, silly ;)"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: ListTile(
              title: Text('Dummy Insect Glaive',
                  style: TextStyle(
                    color: themeProvider.theme.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  )),
              subtitle: const Text(
                'Rare 1',
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          // Add more list items here...
        ],
      ),
    );
  }
}

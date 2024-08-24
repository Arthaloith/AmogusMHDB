import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChargeBladePage extends StatefulWidget {
  const ChargeBladePage({super.key});

  @override
  State<ChargeBladePage> createState() => _ChargeBladePageState();
}

class _ChargeBladePageState extends State<ChargeBladePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: customAppBar(context, 'Charge Blade Path'),
          endDrawer: rightDrawer(context),
          body: Theme(
            data: themeProvider.theme,
            child: chargeBladeList(context, themeProvider),
          ),
        );
      },
    );
  }

  Padding chargeBladeList(BuildContext context, ThemeProvider themeProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("MHP3rd doesn't have Charge Blade, silly ;)"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: ListTile(
              title: Text('Dummy Charge Blade',
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

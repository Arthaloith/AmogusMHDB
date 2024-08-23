import 'package:amogus/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget leftDrawer(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: themeProvider.currentTheme == AppTheme.light
                ? Colors.blue
                : Colors.black,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text('Info',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          '1 An 2 An 3 An ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          textAlign: TextAlign.center,
          '4 An 5 An 6 An ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    ), // Your drawer content
  );
}

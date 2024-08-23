import 'package:amogus/pages/about.dart';
import 'package:amogus/pages/home.dart';
import 'package:amogus/pages/settings.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget rightDrawer(BuildContext context) {
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
          child: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text('Extra Stuffs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AboutPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.source),
          title: const Text('Source'),
          onTap: () async {
            // const url = 'https://github.com/Arthaloith';
            // launchURL(url);
          },
        ),
      ],
    ), // Your drawer content
  );
}

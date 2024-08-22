import 'package:amogus/pages/about.dart';
import 'package:amogus/pages/home.dart';
import 'package:amogus/pages/settings.dart';
import 'package:flutter/material.dart';

Widget rightDrawer(BuildContext context) {
  // Your existing rightDrawer function code
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(
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
              builder: (context) => HomePage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('About'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AboutPage(),
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

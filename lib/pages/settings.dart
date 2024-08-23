import 'package:amogus/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body:
          Container(padding: EdgeInsets.all(10), child: settingsList(context)),
    );
  }

  ListView settingsList(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(children: [
          Icon(
            Icons.settings,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Misc',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          )
        ]),
        Divider(height: 20, thickness: 1, color: Colors.blue),
        SizedBox(
          height: 5,
        ),
        buildMiscSetting(
          context,
          'Change Language',
          [
            Text('Select a language:'),
            SizedBox(height: 5),
            ListTile(
              title: Text('English'),
              onTap: () {
                // Handle language change to English
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Vietnamese'),
              onTap: () {
                // Handle language change to French
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        buildMiscSetting(
          context,
          'Change Theme',
          [
            Text('Select a theme:'),
            SizedBox(height: 5),
            ListTile(
              title: Text('Light'),
              onTap: () {
                context.read<ThemeProvider>().changeTheme(AppTheme.light);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Dark'),
              onTap: () {
                context.read<ThemeProvider>().changeTheme(AppTheme.dark);
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }

  GestureDetector buildMiscSetting(
    BuildContext context,
    String title,
    List<Widget> content,
  ) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text(title),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: content,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'))
                    ]);
              });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blueGrey,
                ),
              ],
            )));
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(
        'Settings',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white, // Change the color here
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

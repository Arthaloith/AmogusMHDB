import 'package:amogus/providers/locale_provider.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
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
      appBar: customAppBar(context, 'Settings'),
      body: Container(
          padding: const EdgeInsets.all(10), child: settingsList(context)),
    );
  }

  ListView settingsList(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Row(children: [
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
        const Divider(height: 20, thickness: 1, color: Colors.blue),
        const SizedBox(
          height: 5,
        ),
        buildMiscSetting(
          context,
          'Change Language',
          [
            const Text('Select a language:'),
            const SizedBox(height: 5),
            ListTile(
              title: const Text('English'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false)
                    .setLocale(const Locale('en', 'US'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Vietnamese'),
              onTap: () {
                Provider.of<LocaleProvider>(context, listen: false)
                    .setLocale(const Locale('vi', 'VN'));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        buildMiscSetting(
          context,
          'Change Theme',
          [
            const Text('Select a theme:'),
            const SizedBox(height: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Light'),
                  onPressed: () {
                    context.read<ThemeProvider>().changeTheme(AppTheme.light);
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('Dark'),
                  onPressed: () {
                    context.read<ThemeProvider>().changeTheme(AppTheme.dark);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
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
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}

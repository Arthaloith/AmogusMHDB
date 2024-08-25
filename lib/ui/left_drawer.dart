import 'package:amogus/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget leftDrawer(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return Drawer(
    child: _buildDrawerContent(themeProvider),
  );
}

Widget _buildDrawerContent(ThemeProvider themeProvider) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      _buildDrawerHeader(themeProvider),
      const Divider(),
      _buildChangelog(),
    ],
  );
}

Widget _buildDrawerHeader(ThemeProvider themeProvider) {
  return DrawerHeader(
    decoration: BoxDecoration(
      color: themeProvider.currentTheme == AppTheme.light
          ? Colors.blue
          : Colors.black,
    ),
    child: const Padding(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        'Info',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _buildChangelog() {
  return Container(
    margin: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Text(
          'Version Changelog',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildVersions(),
      ],
    ),
  );
}

Widget _buildVersions() {
  return Column(
    children: [
      _buildVersion('0.1.0', ['Added themes', 'stuffs fixed']),
      const SizedBox(height: 8),
      _buildVersion(
        '0.1.1',
        ['added noting feature lol'],
      ),
      _buildVersion(
        '0.1.2',
        ['added import and export notes feature'],
      ),
      _buildVersion(
        '0.1.2.1',
        ['catgory screen preparation'],
      ),
      _buildVersion(
        '0.3.0',
        ['added template screens for weapon and ammo categories'],
      ),
      _buildVersion(
        '0.4.0',
        [
          'added template screens for armor categories',
          'added Feedback submition feature'
        ],
      ),
      _buildNews(),
    ],
  );
}

Widget _buildVersion(String version, List<String> items) {
  return Card(
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Version $version',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          ...items.map((item) => Text('• $item')),
        ],
      ),
    ),
  );
}

Widget _buildNews() {
  return Container(
    margin: const EdgeInsets.all(16),
    child: Column(
      children: [
        const Text(
          'Announcements',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...newsItems.map((item) {
          final parts = item.split(' - ');
          final date = parts[0];
          final announcement = parts[1];

          return Column(
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text('• $announcement'),
              const SizedBox(height: 8),
            ],
          );
        }),
      ],
    ),
  );
}

List<String> newsItems = [
  'August 23rd - Hello World!',
  'August 24th - Lol so I added Note utility because why not amirite guys?',
  'August 25th - At this point it is more of a note taking app than a DB app lmao',
];

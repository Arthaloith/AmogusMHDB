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
      _buildVersion('0.1', ['stuffs added idk lol', 'stuffs also fixed lol']),
      const SizedBox(height: 8),
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
];

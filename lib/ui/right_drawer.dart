import 'package:amogus/admin.dart';
import 'package:amogus/pages/about.dart';
import 'package:amogus/pages/feedback.dart';
import 'package:amogus/pages/home.dart';
import 'package:amogus/pages/note/note.dart';
import 'package:amogus/pages/settings.dart';
import 'package:amogus/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
          leading: const Icon(Icons.note),
          title: const Text('Note'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NoteList(),
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
          leading: const Icon(Icons.feedback),
          title: const Text('Feedback'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FeedbackPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.source),
          title: const Text('Source'),
          onTap: () async {
            const url = 'https://monsterhunter.fandom.com/wiki';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not open link')),
              );
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.admin_panel_settings),
          title: const Text('Admin'),
          onTap: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AdminLoginScreen(),
            ));
          },
        ),
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('You have been logged out')),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    ),
  );
}

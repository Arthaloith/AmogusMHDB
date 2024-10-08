import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: appBar(context),
        endDrawer: rightDrawer(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aboutUs(),
          ],
        ),
      );
    });
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        'About Us',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white, // Change the color here
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Padding aboutUs() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Welcome to my MonHun DB Flutter app!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 300,
            child: Text(
              "Disclaimber: I haven't played monhun, what chu gonna do about it?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Slaver:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/icons/profile.jpg'),
              ),
              SizedBox(width: 10),
              Text('Lilith Augustei Celestia'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Contact if you dare:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 10),
              Text('amogus@sus.lmao'),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text('+69420'),
            ],
          ),
          Image.asset('assets/gifs/elite.gif'),
        ],
      ),
    );
  }
}

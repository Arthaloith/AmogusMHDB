import 'package:amogus/ui/rightDrawer.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: const Color(0xffF7F8F8),
      endDrawer: rightDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          aboutUs(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'About Us',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  Padding aboutUs() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Welcome to my MonHun DB Flutter app!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            "Disclaimber: I haven't played monhun, what chu gonna do about it?",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Our Team:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/44740753?v=4'),
              ),
              SizedBox(width: 10),
              Text('Lilith Augustei Celestia < Literally the only person'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Contact if you dare:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email),
              SizedBox(width: 10),
              Text('amogus@sus.lmao'),
            ],
          ),
          SizedBox(height: 10),
          Row(
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

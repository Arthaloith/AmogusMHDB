import 'package:flutter/material.dart';

class WeaponsPage extends StatelessWidget {
  const WeaponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Weapons Page',
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

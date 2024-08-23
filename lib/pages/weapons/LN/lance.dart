import 'package:flutter/material.dart';

class LancePage extends StatelessWidget {
  const LancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Monsters Page',
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

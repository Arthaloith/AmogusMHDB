import 'package:flutter/material.dart';

class LongSwordPage extends StatelessWidget {
  const LongSwordPage({super.key});

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

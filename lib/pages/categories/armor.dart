import 'package:flutter/material.dart';

class ArmorsPage extends StatelessWidget {
  const ArmorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Armors Page',
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

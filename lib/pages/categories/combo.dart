import 'package:flutter/material.dart';

class CombosPage extends StatelessWidget {
  const CombosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Combos Page',
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

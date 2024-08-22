import 'package:flutter/material.dart';

class AmmosPage extends StatelessWidget {
  const AmmosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Ammos Page',
            style: TextStyle(fontSize: 50),
          ),
        ));
  }
}

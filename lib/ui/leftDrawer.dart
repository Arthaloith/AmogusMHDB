import 'package:flutter/material.dart';

Widget leftDrawer(BuildContext context) {
  // Your existing rightDrawer function code
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text('Info',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Text(
            textAlign: TextAlign.center,
            '1 An 2 An 3 An ',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        Text(
          textAlign: TextAlign.center,
          '4 An 5 An 6 An ',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    ), // Your drawer content
  );
}

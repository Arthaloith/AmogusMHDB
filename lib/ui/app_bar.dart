import 'package:amogus/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

AppBar customAppBar(BuildContext context, String title, {bool isHome = false}) {
  final themeProvider = Provider.of<ThemeProvider>(context);

  return AppBar(
    title: Text(title,
        style: TextStyle(
          color: themeProvider.currentTheme == AppTheme.light
              ? Colors.white
              : Colors.white,
        )),
    centerTitle: true,
    backgroundColor: themeProvider.currentTheme == AppTheme.light
        ? Colors.blue
        : Colors.black,
    elevation: 0.0,
    // Hide drawer hamburger button
    automaticallyImplyLeading: false,
    // Info button or back button
    leading: Builder(builder: (context) {
      if (isHome) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/info.svg',
                width: 30, height: 30),
          ),
        );
      } else {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/arrow_left.svg',
                width: 30, height: 30),
          ),
        );
      }
    }),
    // menu button
    actions: [
      Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: const Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset('assets/icons/dots.svg',
                width: 20, height: 20),
          ),
        );
      }),
    ],
  );
}

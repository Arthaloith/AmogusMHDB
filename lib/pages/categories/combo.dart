import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Combo {
  final String title;
  final String detailPageRoute;

  Combo({required this.title, required this.detailPageRoute});
}

class CombosPage extends StatelessWidget {
  final List<Combo> _combos = [
    Combo(title: 'Combo 1', detailPageRoute: '/combo1Detail'),
    Combo(title: 'Combo 2', detailPageRoute: '/combo2Detail'),
    Combo(title: 'Combo 3', detailPageRoute: '/combo3Detail'),
  ];

  CombosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: customAppBar(context, 'Combos'),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _combos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_combos[index].title),
                      onTap: () {
                        Navigator.pushNamed(
                            context, _combos[index].detailPageRoute);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

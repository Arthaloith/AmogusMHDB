import 'package:flutter/material.dart';

// Define the armor data
class Armor {
  final String name;
  final String image;

  Armor({required this.name, required this.image});
}

// Define the armor detail page
class ArmorDetailPage extends StatelessWidget {
  final Armor armor;

  ArmorDetailPage({required this.armor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(armor.name),
      ),
      body: Theme(
        data: ThemeData.dark(),
        child: Column(children: [Image.asset(armor.image), Text(armor.name)]),
      ),
    );
  }
}

// Define the low rank blademaster armor page
class LowRankBlademasterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the armor data
    List<Armor> armors = [
      Armor(name: 'Low Rank Blademaster Head', image: 'assets/images/head.png'),
      Armor(
          name: 'Low Rank Blademaster Chest', image: 'assets/images/chest.png'),
      Armor(name: 'Low Rank Blademaster Arms', image: 'assets/images/arms.png'),
      Armor(
          name: 'Low Rank Blademaster Waist', image: 'assets/images/waist.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Low Rank Blademaster'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: armors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ArmorDetailPage(armor: armors[index])),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(armors[index].image),
                  Text(armors[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

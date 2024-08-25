import 'package:amogus/pages/armors/LR/Blademaster/yukumo.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';

// Define the armor data
class Armor {
  final String name;
  final String image;

  Armor({required this.name, required this.image});
}

// Define the low rank blademaster armor page
class LowRankBlademasterPage extends StatelessWidget {
  const LowRankBlademasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the armor data
    List<Armor> armors = [
      Armor(
          name: 'Yukumo',
          image: 'assets/ArmorSets/LR/Blademaster/Yukumo-Armor.webp'),
      Armor(
          name: 'Low Rank Blademaster Chest', image: 'assets/images/chest.png'),
      Armor(name: 'Low Rank Blademaster Arms', image: 'assets/images/arms.png'),
      Armor(
          name: 'Low Rank Blademaster Waist', image: 'assets/images/waist.png'),
    ];

    return Scaffold(
      appBar: customAppBar(context, 'Low Rank Blademaster'),
      endDrawer: rightDrawer(context),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                  builder: (context) => ArmorDetailPage(armor: armors[index]),
                ),
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

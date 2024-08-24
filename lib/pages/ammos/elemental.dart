import 'package:amogus/ui/app_bar.dart';
import 'package:flutter/material.dart';

class ElementalAmmoPage extends StatefulWidget {
  const ElementalAmmoPage({super.key});

  @override
  State<ElementalAmmoPage> createState() => _ElementalAmmoPageState();
}

class _ElementalAmmoPageState extends State<ElementalAmmoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Elemental Ammo'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Attack Ammo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              children: const [
                TableRow(
                  children: [
                    Text('Name'),
                    Text('Description'),
                    Text('Shots'),
                    Text('Sell Price'),
                    Text('Rarity'),
                  ],
                ),
                TableRow(
                  children: [
                    Text('Piercing Bullet'),
                    Text('A bullet that deals piercing damage to monsters.'),
                    Text('5'),
                    Text('100z'),
                    Text('Rare'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Where to Obtain',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const BulletPointList(
              items: [
                'Dropped by Genprey in the Wildspire Waste',
                'Purchased from the Provisions Stockpile in Astera',
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Bowguns Capable of using the Ammo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const BulletPointList(
              items: [
                'Light Bowgun: Hunter\'s Rifle',
                'Heavy Bowgun: Blazing Assault',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPointList extends StatelessWidget {
  final List<String> items;

  const BulletPointList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => Text('• $item')).toList(),
    );
  }
}

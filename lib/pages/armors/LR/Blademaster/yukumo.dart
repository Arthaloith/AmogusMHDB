import 'package:amogus/pages/armors/lr_blademaster.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';

class ArmorDetailPage extends StatefulWidget {
  final Armor armor; // Define the Armor field
  const ArmorDetailPage({required this.armor, super.key});

  @override
  _ArmorDetailPageState createState() => _ArmorDetailPageState();
}

class CenteredTableCell extends StatelessWidget {
  final Widget child;
  const CenteredTableCell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Center(child: child),
    );
  }
}

class _ArmorDetailPageState extends State<ArmorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, widget.armor.name),
      endDrawer: rightDrawer(context),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    border: Border.all(
                      width: 3, // adjust the width to your liking
                      color: Colors.black, // adjust the color to your liking
                    ),
                  ),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(widget.armor.image),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Table(
                              border: TableBorder.all(color: Colors.black),
                              children: [
                                const TableRow(
                                  decoration:
                                      BoxDecoration(color: Colors.yellow),
                                  children: [
                                    CenteredTableCell(child: Text('')),
                                    CenteredTableCell(child: Text('Defense')),
                                    CenteredTableCell(child: Text('Name')),
                                    CenteredTableCell(child: Text('Slots')),
                                    CenteredTableCell(
                                        child: Text('Crafting Materials')),
                                    CenteredTableCell(child: Text('Cost')),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 46, 189, 255)
                                          .withOpacity(0.2)),
                                  children: [
                                    CenteredTableCell(
                                        child: Image.asset(
                                            'assets/icons/ArmorType/Helm.webp',
                                            width: 20,
                                            height: 20)),
                                    const CenteredTableCell(child: Text('1~21')),
                                    const CenteredTableCell(
                                        child: Text('Yukumo Hat')),
                                    const CenteredTableCell(child: Text('---')),
                                    const CenteredTableCell(
                                        child: Text(
                                            'Yukumo Wood x1, Gagua Feather x1')),
                                    const CenteredTableCell(child: Text('50z')),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 46, 189, 255)
                                          .withOpacity(0.2)),
                                  children: [
                                    CenteredTableCell(
                                        child: Image.asset(
                                            'assets/icons/ArmorType/Plate.webp',
                                            width: 20,
                                            height: 20)),
                                    const CenteredTableCell(child: Text('1~21')),
                                    const CenteredTableCell(
                                        child: Text('Yukumo Chest')),
                                    const CenteredTableCell(child: Text('---')),
                                    const CenteredTableCell(
                                        child: Text(
                                            'Yukumo Wood x2, Gagua Feather x2')),
                                    const CenteredTableCell(child: Text('100z')),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 46, 189, 255)
                                          .withOpacity(0.2)),
                                  children: [
                                    CenteredTableCell(
                                        child: Image.asset(
                                            'assets/icons/ArmorType/Gauntlets.webp',
                                            width: 20,
                                            height: 20)),
                                    const CenteredTableCell(child: Text('1~21')),
                                    const CenteredTableCell(
                                        child: Text('Yukumo Arms')),
                                    const CenteredTableCell(child: Text('---')),
                                    const CenteredTableCell(
                                        child: Text(
                                            'Yukumo Wood x1, Gagua Feather x1')),
                                    const CenteredTableCell(child: Text('50z')),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 46, 189, 255)
                                          .withOpacity(0.2)),
                                  children: [
                                    CenteredTableCell(
                                        child: Image.asset(
                                            'assets/icons/ArmorType/Waist.webp',
                                            width: 20,
                                            height: 20)),
                                    const CenteredTableCell(child: Text('1~21')),
                                    const CenteredTableCell(
                                        child: Text('Yukumo Waist')),
                                    const CenteredTableCell(child: Text('---')),
                                    const CenteredTableCell(
                                        child: Text(
                                            'Yukumo Wood x1, Gagua Feather x1')),
                                    const CenteredTableCell(child: Text('50z')),
                                  ],
                                ),
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 46, 189, 255)
                                          .withOpacity(0.2)),
                                  children: [
                                    CenteredTableCell(
                                        child: Image.asset(
                                            'assets/icons/ArmorType/Leggings.webp',
                                            width: 20,
                                            height: 20)),
                                    const CenteredTableCell(child: Text('1~21')),
                                    const CenteredTableCell(
                                        child: Text('Yukumo Legs')),
                                    const CenteredTableCell(child: Text('---')),
                                    const CenteredTableCell(
                                        child: Text(
                                            'Yukumo Wood x1, Gagua Feather x1')),
                                    const CenteredTableCell(child: Text('50z')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Skills: Spirit\'s Whim, Divine Protection'),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Resistance: ',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const TextSpan(
                                  text: '0 Fire, ',
                                  style: TextStyle(color: Colors.red),
                                ),
                                TextSpan(
                                  text: '0 Water, ',
                                  style: TextStyle(color: Colors.blue[800]),
                                ),
                                const TextSpan(
                                  text: '+15 Thunder, ',
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 237, 171, 5)),
                                ),
                                TextSpan(
                                  text: '0 Ice, ',
                                  style: TextStyle(color: Colors.blue[200]),
                                ),
                                TextSpan(
                                  text: '5 Dragon',
                                  style: TextStyle(color: Colors.purple[800]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

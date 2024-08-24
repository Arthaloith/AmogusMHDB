import 'package:amogus/providers/theme_provider.dart';
import 'package:amogus/ui/app_bar.dart';
import 'package:amogus/ui/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YukumoBowPage extends StatefulWidget {
  const YukumoBowPage({super.key});

  @override
  _YukumoBowPageState createState() => _YukumoBowPageState();
}

class _YukumoBowPageState extends State<YukumoBowPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle tableTextStyle = const TextStyle(fontSize: 14, color: Colors.black);
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: customAppBar(context, 'Yukumo Bow Path'),
        endDrawer: rightDrawer(context),
        body: Theme(
          data: themeProvider.theme,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                disclaimerText(themeProvider),
                const SizedBox(height: 30),
                weaponTable(themeProvider, tableTextStyle),
              ],
            ),
          ),
        ),
      );
    });
  }

  Align disclaimerText(ThemeProvider themeProvider) {
    return Align(
      alignment: Alignment.center,
      child: Text(
          'Recommended to change to landscape to view table if you are on mobile',
          style: TextStyle(
            fontSize: 20,
            color: themeProvider.theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          )),
    );
  }

  Padding weaponTable(ThemeProvider themeProvider, TextStyle tableTextStyle) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(width: 1.0, color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(2), // Weapon Name
            1: FlexColumnWidth(1), // Attack
            2: FlexColumnWidth(1), // Special
            3: FlexColumnWidth(1), // Type
            4: FlexColumnWidth(1), // Slots
            5: FlexColumnWidth(1), // Affinity
            6: FlexColumnWidth(1), // Rarity
          },
          children: [
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFF9900)),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Weapon Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Attack',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Special',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Type',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Slots',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Affinity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Rarity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.theme.brightness == Brightness.dark
                          ? Colors.black
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Text(
                    'Old Yukumo Bow (古ユクモノ弓)',
                    style: tableTextStyle,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '50 (65)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'N/A',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Spread',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '---',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '1',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/Indent01.webp',
                        width: 30,
                        height: 30,
                      ),
                      Flexible(
                        child: Text(
                          'Yukumo Bow \n(ユクモノ弓)',
                          style: tableTextStyle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '70 (85)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'N/A',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Spread',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '---',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '1',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          'assets/icons/Indent02.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Yukumo Bow+ \n(ユクモノ弓改) ',
                          style: tableTextStyle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '110 (115)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'N/A',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Spread',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '---',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '2',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          'assets/icons/Indent03.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Image.asset(
                          'assets/icons/Indent02.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Flexible(
                        child: Transform.translate(
                          offset: const Offset(-17, 0),
                          child: Text(
                            'Froggi Revolver I\n(フロギィリボルバーI)',
                            style: tableTextStyle,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '120 (135)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'N/A',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Explosive',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '---',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '2',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          'assets/icons/Indent03.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Image.asset(
                          'assets/icons/Indent01.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Flexible(
                        child: Transform.translate(
                          offset: const Offset(-17, 0),
                          child: Text(
                            'Harara Peco\n(ハララペッコ)',
                            style: tableTextStyle,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '120 (135)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/Elements/Fire_Adell_1.webp',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        '16',
                        style: tableTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Spread',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'O--',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '2',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFFFCC66)),
              children: [
                TableCell(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Image.asset(
                          'assets/icons/Indent01.webp',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Flexible(
                        child: Transform.translate(
                          offset: const Offset(-5, 0),
                          child: Text(
                            'Sponge Gear I\n(スポンギアI)',
                            style: tableTextStyle,
                            maxLines: null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '120 (135)',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/Elements/Water_Adell_1.webp',
                        width: 30,
                        height: 30,
                      ),
                      Text(
                        '12',
                        style: tableTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    'Spread',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '---',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '0% ',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Text(
                    '2',
                    style: tableTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

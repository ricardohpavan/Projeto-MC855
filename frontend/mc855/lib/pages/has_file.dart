import 'package:flutter/material.dart';

import 'package:mc855/pages/inventory.dart';
import 'package:mc855/pages/scan.dart';

class HasFile extends StatefulWidget {
  final file;
  const HasFile({
    required this.file,
    super.key,
  });

  @override
  State<HasFile> createState() => _HasFileState(file);
}

class _HasFileState extends State<HasFile> {
  late var file;
  int currentPage = 0;
  _HasFileState(this.file);

  final widgetOptions = [
    Inventory(),
    const Scan(),
  ];
  final widgetTitle = ["Prédios", "Scan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetTitle.elementAt(currentPage)),
      ),
      body: Center(child: widgetOptions.elementAt(currentPage)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment,
            ),
            label: 'Prédios',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
            ),
            label: 'Scan',
          ),
        ],
        onTap: (index) => setState(() {
          currentPage = index;
        }),
        currentIndex: currentPage,
      ),
    );
  }
}

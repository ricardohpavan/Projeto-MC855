import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mc855/components/building_card.dart';

class Inventory extends StatefulWidget {
  final file;
  const Inventory({
    this.file,
    super.key,
  });

  @override
  State<Inventory> createState() => _InventoryState(file);
}

class _InventoryState extends State<Inventory> {
  late var file;
  List _items = [];
  int currentPage = 0;

  _InventoryState(this.file);

  void readJson() async {
    final String response = await rootBundle.loadString('lib/assets/n1.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return _items.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return BuildingCard(item: _items[index]);
                  },
                ),
              )
            ],
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

import 'package:flutter/material.dart';

class BuildingCard extends StatelessWidget {
  final item;

  const BuildingCard({super.key, this.item});

  @override
  Widget build(BuildContext context) => Card(
        key: ValueKey(item["id"]),
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        color: Colors.blue.shade100,
        child: ListTile(
          title: Text(item["name"]),
        ),
      );
}

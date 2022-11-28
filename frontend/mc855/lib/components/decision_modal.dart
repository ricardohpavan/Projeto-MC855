import 'package:flutter/material.dart';

class DecisionModal extends StatefulWidget {
  final dynamic item;
  const DecisionModal({Key? key, required this.item}) : super(key: key);

  @override
  State<DecisionModal> createState() => _DecisionModalState();
}

class _DecisionModalState extends State<DecisionModal> {
  @override
  Widget build(BuildContext context) {
    if (widget.item == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SimpleDialog(
      title: const Text('Item encontrado'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.1,
      ),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Item:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' ${widget.item['Área de Patrimônio']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Local:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' ${widget.item['Área de Patrimônio']} -> ${widget.item['Local N2']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'O item está no local correto?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(80),
                      ),
                    ),
                    child: const Text(
                      'Não',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(80),
                      ),
                    ),
                    child: const Text(
                      'Sim',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

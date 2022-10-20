import 'package:flutter/material.dart';

class DecisionModal extends StatelessWidget {
  const DecisionModal({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: const [
                Text(
                  'Item:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' Cadeira de escritório',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'Local:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' IC -> Pavimento 2 -> Sala 514',
                  style: TextStyle(
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
                      fixedSize: MaterialStatePropertyAll(
                        Size.fromWidth(80),
                      ),
                    ),
                    child: const Text(
                      'Sim',
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
                      'Não',
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

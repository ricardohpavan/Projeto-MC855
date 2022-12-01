import 'package:flutter/material.dart';
import 'package:mc855/components/local_modal.dart';

import '../api/api_service.dart';

class MoveDecisionModal extends StatefulWidget {
  final dynamic item;
  final dynamic id;
  const MoveDecisionModal({Key? key, required this.item, required this.id})
      : super(key: key);

  @override
  State<MoveDecisionModal> createState() => _MoveDecisionModalState();
}

class _MoveDecisionModalState extends State<MoveDecisionModal> {
  Future<void> _setItemStatus(status) async {
    try {
      await ApiService().setItemStatus(widget.id, status).then((response) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade600,
            content: const Text("Status do item alterado"),
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao tentar mudar status do item"),
      ));
    }
  }

  Future<void> _setItemLocation() async {
    try {
      await ApiService()
          .setItemLocation(
              widget.id,
              widget.item['Área de Patrimônio'],
              widget.item['Desc. Órgão'],
              widget.item['Imóvel'],
              widget.item['Local N1'],
              widget.item['Local N2'],
              widget.item['Local N3'],
              widget.item['Local N4'],
              widget.item['Local N5'])
          .then((response) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade600,
            content: const Text("Local do item alterado"),
          ),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao tentar mudar local do item"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('O que deseja fazer?'),
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.1,
        color: Colors.black,
      ),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _setItemStatus(1),
                child: Text(
                  'Retornar item para ${widget.item['Local N2']}',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => LocalModal(
                      id: widget.id,
                    ),
                  );
                },
                child: const Text(
                  'Deixar item onde está atualmente',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancelar',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

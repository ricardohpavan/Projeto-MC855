import 'package:flutter/material.dart';

import '../api/api_service.dart';
import 'move_decision_modal.dart';

class LocalModal extends StatefulWidget {
  final dynamic id;
  const LocalModal({Key? key, required this.id}) : super(key: key);

  @override
  State<LocalModal> createState() => _LocalModalState();
}

class _LocalModalState extends State<LocalModal> {
  TextEditingController areaController = TextEditingController();
  TextEditingController orgController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  TextEditingController n3Controller = TextEditingController();
  TextEditingController n4Controller = TextEditingController();
  TextEditingController n5Controller = TextEditingController();

  Future<void> _setItemLocation() async {
    try {
      await ApiService()
          .setItemLocation(
        widget.id,
        areaController.text.isEmpty ? null : areaController.text,
        orgController.text.isEmpty ? null : orgController.text,
        buildingController.text.isEmpty ? null : buildingController.text,
        n1Controller.text.isEmpty ? null : n1Controller.text,
        n2Controller.text.isEmpty ? null : n2Controller.text,
        n3Controller.text.isEmpty ? null : n3Controller.text,
        n4Controller.text.isEmpty ? null : n4Controller.text,
        n5Controller.text.isEmpty ? null : n5Controller.text,
      )
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

  Future<void> _setItemStatus(status) async {
    try {
      await ApiService().setItemStatus(widget.id, status).then((response) {
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

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Onde este item se encontra?'),
      titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.1,
          color: Colors.black),
      contentPadding: const EdgeInsets.all(20),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: areaController,
                decoration: const InputDecoration(
                  labelText: "Área de Patrimônio",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: orgController,
                decoration: const InputDecoration(
                  labelText: "Descrição Órgão",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: buildingController,
                decoration: const InputDecoration(
                  labelText: "Imóvel",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: n1Controller,
                decoration: const InputDecoration(
                  labelText: "Local N1",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: n2Controller,
                decoration: const InputDecoration(
                  labelText: "Local N2",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: n3Controller,
                decoration: const InputDecoration(
                  labelText: "Local N3",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: n4Controller,
                decoration: const InputDecoration(
                  labelText: "Local N4",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                controller: n5Controller,
                decoration: const InputDecoration(
                  labelText: "Local N5",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await _setItemLocation();
                  await _setItemStatus(1);
                },
                child: const Text(
                  'Enviar',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

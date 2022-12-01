import 'package:flutter/material.dart';
import 'package:mc855/api/api_service.dart';
import 'package:mc855/components/decision_modal.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  TextEditingController inputController = TextEditingController();

  void handleAnalysis(id) async {
    showDialog(
      context: context,
      builder: (_) => DecisionModal(
        item: null,
        id: inputController.text,
      ),
    );
    try {
      await ApiService().getItem(id).then((response) {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (_) => DecisionModal(
            item: response,
            id: inputController.text,
          ),
        );
      });
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
            "Erro ao buscar item, verifique o ID digitado e tente novamente"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MC855 - Inventário'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            const Text(
              'Procure itens pelo ID',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
              child: TextField(
                controller: inputController,
                decoration: const InputDecoration(
                  labelText: "Digite o ID do objeto",
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
            ElevatedButton(
              onPressed: () {
                if (inputController.text.isNotEmpty) {
                  handleAnalysis(inputController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          "Por favor, digite o ID do objeto e tente novamente"),
                    ),
                  );
                }
              },
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(40)),
              ),
              child: const Text(
                'Analisar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(flex: 2),
            const ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
              ),
              child: Text(
                'Sumário',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

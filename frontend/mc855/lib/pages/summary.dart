import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:mc855/api/api_service.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  Map scannedItems = {};
  Map notScannedItems = {};

  @override
  void initState() {
    super.initState();
    _getItems();
  }

  Future<void> _getItems() async {
    try {
      await ApiService().scannedItems().then((response) {
        setState(() {
          scannedItems = response;
        });
      });
      await ApiService().notScannedItems().then((response) {
        setState(() {
          notScannedItems = response;
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao coletar itens"),
      ));
    }
  }

  Widget renderScannedItems() {
    return Expanded(
      child: ListView.builder(
          itemCount: scannedItems.keys.toList().length,
          itemBuilder: (BuildContext context, int index) {
            String key = scannedItems.keys.elementAt(index);
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '$key - ${scannedItems[key]['Descrição']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    "${scannedItems[key]['Área de Patrimônio']} -> ${scannedItems[key]['Local N2']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Divider(
                  height: 2.0,
                ),
              ],
            );
          }),
    );
  }

  Widget renderNotScannedItems() {
    return Expanded(
      child: ListView.builder(
          itemCount: notScannedItems.keys.toList().length,
          itemBuilder: (BuildContext context, int index) {
            String key = notScannedItems.keys.elementAt(index);
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    '$key - ${notScannedItems[key]['Descrição']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    "${notScannedItems[key]['Área de Patrimônio']} -> ${notScannedItems[key]['Local N2']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Divider(
                  height: 2.0,
                ),
              ],
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (scannedItems == {} && notScannedItems == {}) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sumário'),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sumário'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Itens escaneados:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    renderScannedItems(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Itens não escaneados:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    renderNotScannedItems(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

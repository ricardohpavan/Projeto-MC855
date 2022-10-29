import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('MC855 - Inventário'),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),
            Spacer(),
            Text(
              'Procure itens pelo ID',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
              child: TextField(
                decoration: InputDecoration(
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
              onPressed: null,
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(40)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: Text(
                'Analisar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size.fromHeight(50)),
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
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

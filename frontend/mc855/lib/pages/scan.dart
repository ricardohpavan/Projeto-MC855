import 'package:flutter/material.dart';

class Scan extends StatelessWidget {
  const Scan({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.qr_code,
            size: 200,
          ),
          ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
              ),
              child: Text(
                'Escanear QR CODE',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'ou',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            'Escanear código de  barras\nEscanear código escrito\nDigitar ID do objeto',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                height: 1.5),
          )
        ],
      );
}

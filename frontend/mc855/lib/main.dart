import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mc855/api/api_service.dart';
import 'package:mc855/pages/scan.dart';
import 'package:mc855/pages/upload.dart';
import 'package:mc855/components/overlay_loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    _hasData().then((value) {
      print(value);
      value
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Scan(),
              ),
            )
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Upload(),
              ),
            );
    });
  }

  Future<bool> _hasData() async {
    try {
      return await ApiService().uploadCheck().then((response) {
        var teste = jsonDecode(response!);
        print(teste['was-file-uploaded']);
        return teste['was-file-uploaded'];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Erro ao verificar dados"),
      ));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MC855 - Inventário'),
        centerTitle: true,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

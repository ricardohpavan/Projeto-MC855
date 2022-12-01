import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mc855/api/api_service.dart';
import 'package:mc855/components/overlay_loading.dart';
import 'package:mc855/pages/scan.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool isLoading = false;

  void _pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      var result = await FilePicker.platform.pickFiles(withData: true);
      if (result == null) {
        setState(() {
          isLoading = false;
        });
        return;
      }
      PlatformFile file = result.files.first;
      await ApiService().upload(file).then((response) {
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scan(),
          ),
        );
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Erro ao enviar arquivo, tente novamente mais tarde"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
              ),
              onPressed: () async {
                _pickFile();
              },
              child: const Icon(
                Icons.file_upload_outlined,
                size: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Importar planilha SIAD',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
    return isLoading
        ? Stack(
            children: [body, const OverlayLoading()],
          )
        : body;
  }
}

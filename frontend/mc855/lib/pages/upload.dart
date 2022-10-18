import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:mc855/components/overlay_loading.dart';
import 'package:mc855/pages/has_file.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool isLoading = false;

  void pickFile() async {
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
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HasFile(file: file)));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = Center(
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
              pickFile();
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
    );
    return isLoading
        ? Stack(
            children: [body, const OverlayLoading()],
          )
        : body;
  }
}

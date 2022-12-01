import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> getItem(itemId) async {
    try {
      var url = Uri.parse('http://127.0.0.1:8000/get-item/$itemId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw ("Error getting item");
    }
    return null;
  }

  Future<String?> uploadCheck() async {
    try {
      var url = Uri.parse('http://127.0.0.1:8000/upload-check');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw ("Error checking upload");
    }
    return null;
  }

  Future<http.Response> upload(PlatformFile file) async {
    var request = http.MultipartRequest(
      "PUT",
      Uri.parse('http://127.0.0.1:8000/upload'),
    );
    request.files.add(
      http.MultipartFile.fromBytes('file', file.bytes!,
          filename: 'inventory.xlsx'),
    );
    request.headers.addAll(
      {
        r'Content-Type': 'application/json',
      },
    );
    var streamedResponse = await request.send();
    var result = await http.Response.fromStream(streamedResponse);
    return result;
  }

  Future<dynamic> setItemStatus(itemId, status) async {
    try {
      var url = Uri.parse(
          'http://127.0.0.1:8000/set-item-status?item_id=$itemId&status=$status');
      var response = await http.put(url);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      throw ("Error setting status item");
    }
    return null;
  }
}

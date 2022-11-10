import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiService {
  Future<String?> getItem(itemId) async {
    try {
      var url = Uri.parse('http://127.0.0.1:8000/get-item/$itemId');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

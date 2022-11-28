import 'dart:convert';

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
}

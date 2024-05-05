import 'dart:convert';

import 'package:book_exchange_platform/models/book_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<GetBookModel?> getBookDetails() async {
    const url =
        'https://my-json-server.typicode.com/ujjwaldeydeveloper/book_json/db';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return GetBookModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    }
    return null;
  }
}

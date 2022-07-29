import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices{
  static Future<List> fetchData() async {
    var response = await http.get(Uri.parse("https://picsum.photos/v2/list"));
    if (response.statusCode == 200) {
      print('Response:${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  static Future<dynamic> get(String url) async {
    try {
      dynamic response = "";
      response = await http.get(
        Uri.parse(url),
        headers: {
          'apikey': 'xlPr7F7ROSUQxrc9MK6oX294Ck37rWb0',
        },
      );
      if (response.statusCode == 200) {
        print('Api called brother');
        return response.body;
      } else {
        print("Gen erè ki pase");
        return "no";
      }
    } catch (e) {
      print("Reket sa echwe akoz de ..." + e.toString());
    }
  }

  static Future<dynamic> post(String url, {required Map body}) async {
    final response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      print("Gen erè ki pase");
    }
  }
}

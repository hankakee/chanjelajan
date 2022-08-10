import 'dart:convert';

class Currency {
  String code;
  String namec;

  Currency({required this.code, required this.namec});

  static Map fromJson(jsonstring) {
    var decodedstr = json.decode(jsonstring);
    return Map.from(decodedstr["symbols"]).map((k, v) => MapEntry(k, v));
  }
}

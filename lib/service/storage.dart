import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class Storage {
// Create storage
  static const localstorage = FlutterSecureStorage();

  static Future<List> storedCurrencies() async {
    String? value = await localstorage.read(key: "currencieslocal");
    List tabCurrs = [];
    if (value != null) {
      tabCurrs = jsonDecode(value);
    }
    return tabCurrs;
  }

  static void writeCurrencies(table) async {
    await localstorage.write(key: "currencieslocal", value: json.encode(table));
  }
}

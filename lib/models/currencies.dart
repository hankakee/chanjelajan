import 'dart:convert';

class Currency {
  String code;
  String namec;

  Currency({required this.code, required this.namec});

//   factory Currency.fromMap(Map map) {
//     return Currency(code: map.keys, namec:map.values);
//   }

//   factory Currency.fromMap(var map) {
// //     print(map['AED']);
//     return Currency(
//       code:  '',
//       namec:  ''
//     );
//   }
  // factory Currency.fromJson(var source) {
  //   print(source);
  //   return Currency(code: '', namec: '');
  // }

  static Map fromJson(jsonstring) {
    // print(Map.from(jsonstring["symbols"])
    //     .map((k, v) => MapEntry<String, String>(k, v)));

    return Map.from(jsonstring["symbols"]).map((k, v) => MapEntry(k, v));
  }

  // Map tabCurrencies=fromJson3(jsonmapc);
  //   tabCurrencies.forEach((k,v){
  //     print('$k , $v');
  //     print(".....");
  //   });

  //  factory Product.fromMap(Map<String, dynamic> map) {
  //   return Product(
  //     id: map['id']?.toInt() ?? 0,
  //     name: map['name'] ?? '',
  //     price: map['price']?.toDouble() ?? 0.0,
  //     image: map['image'] ?? '',
  //     description: map['description'],
  //     category: map['category'] != null ? Category.fromMap(map['category']) : null,
  //   );
  // }

  // factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}

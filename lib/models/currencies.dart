import 'dart:convert';
import 'package:chanjelajan/helpers/database_helper.dart';

import 'istorik.dart';
class Currency {
  String code;
  String namec;
  Currency({required this.code, required this.namec});

  static Map fromJson(jsonstring) {
    var decodedstr = json.decode(jsonstring);
    return Map.from(decodedstr["symbols"]).map((k, v) => MapEntry(k, v));
  }

  static Future<List<String>> getListCurrencies() async {
   try{
     final db = await DatabaseHelper.instance.database;
     // await db.query();
     var tbname=Istorik.getTableName();
     final List allresults = await db.rawQuery('SELECT distinct tb1.tocurrency,tb1.fromcurrency FROM ${tbname} tb1');
    print(allresults);
    List <String> finalcurrs=[];
    for(var i=0;i<allresults.length;i++){
      finalcurrs.add(allresults[i]['tocurrency'].toString());
      finalcurrs.add(allresults[i]['fromcurrency'].toString());
    }
     var seen = Set<String>();
     List<String> uniquelist = finalcurrs.where((crr) => seen.add(crr)).toList();
     print(uniquelist);
    print("uniquelist");
    print(uniquelist);
    return uniquelist;
   }catch(e){
     print("something bad has happened..."+e.toString());
     return [''];
   }
  }
}

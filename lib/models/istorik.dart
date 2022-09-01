import 'dart:convert';
import 'package:chanjelajan/helpers/database_helper.dart';

class Istorik {
  int id;
  DateTime datecomplete;
  double fromqty;
  double toqty;
  String fromcurrency;
  String tocurrency;
  static const String _tableName = 'moneyconverted';
  Istorik({
    required this.id,
    required this.datecomplete,
    required this.fromqty,
    required this.toqty,
    required this.fromcurrency,
    required this.tocurrency,
  });

  factory Istorik.fromMap(Map<String, dynamic> json) => Istorik(
        id: json["id"].toInt() ?? 0,
        datecomplete: DateTime.parse(json["datecomplete"]),
        fromqty: json["fromqty"].toDouble() ?? 0,
        toqty: json["toqty"].toDouble() ?? 0,
        fromcurrency: json["fromcurrency"] ?? '',
        tocurrency: json["tocurrency"] ?? '',
      );

  factory Istorik.fromJson(String source) =>
      Istorik.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "datecomplete":datecomplete.toIso8601String(),
      "fromqty": fromqty,
      "toqty": toqty,
      "fromcurrency": fromcurrency,
      "tocurrency": tocurrency
    };
  }

  String toJson() => json.encode(toMap());

   static String getTableName(){
     return _tableName;
   }

  static Future<int> insertConvert(Istorik istorikObj) async {
    print("Launch insert method bro");
    print("istorikObj to insert....");
    print(istorikObj.toMap());
   try{
     final db = await DatabaseHelper.instance.database;
     await db.transaction((txn) async {
       int id1 = await txn.rawInsert(
           "INSERT INTO ${_tableName}(datecomplete, fromqty,toqty,fromcurrency,tocurrency) VALUES('${DateTime.now()}', ${istorikObj.fromqty},${istorikObj.toqty},'${istorikObj.fromcurrency}', '${istorikObj.tocurrency}')");
        print(id1.toString());
     });
     print("the db after bro:");
     print("added in database...");
     return 1;
   }catch(e){

  print("problem found...:"+e.toString());
  return 0;
   }

  }
  static Future<List<Istorik>> getHistoric() async {
    final db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> allresults = await db.query(_tableName, orderBy:'id DESC');
        return List.generate(allresults.length,(i) {
          return Istorik.fromMap( allresults[i] );
        });
  }
}

import 'dart:convert';

class Istorik {
  int id;
  DateTime datecomplete;
  double fromqty;
  double toqty;
  String fromcurrency;
  String tocurrency;

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
      "datecomplete":
          "${datecomplete.year.toString().padLeft(4, '0')}-${datecomplete.month.toString().padLeft(2, '0')}-${datecomplete.day.toString().padLeft(2, '0')}",
      "fromqty": fromqty,
      "toqty": toqty,
      "fromcurrency": fromcurrency,
      "tocurrency": tocurrency
    };
  }

  String toJson() => json.encode(toMap());
}

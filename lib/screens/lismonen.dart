import 'package:flutter/material.dart';

class LisMonen extends StatefulWidget {
  const LisMonen({Key? key}) : super(key: key);

  @override
  State<LisMonen> createState() => _LisMonenState();
}

class _LisMonenState extends State<LisMonen> {
  var infoLismonnen = {
    "CUC": "Cuban Convertible Peso",
    "CUP": "Cuban Peso",
    "CVE": "Cape Verdean Escudo",
    "CZK": "Czech Republic Koruna",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DJF": "Djiboutian Franc",
    "DKK": "Danish Krone",
    "DOP": "Dominican Peso",
    "DZD": "Algerian Dinar",
    "EGP": "Egyptian Pound",
    "ERN": "Eritrean Nakfa",
    "ETB": "Ethiopian Birr"
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lis monen ou itilize deja",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        // margin: const EdgeInsets.only(top: 20.0),
        // color: Colors.red,
        // decoration: BoxDecoration(
        //     gradient:LinearGradient(
        //   colors: [Color(0xffe91e63), Color(0xff9c27b0)],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // )),
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: List.generate(
              infoLismonnen.length,
              (index) => Card(
                    child: ListTile(
                      leading: Icon(Icons.monetization_on_outlined),
                      title: Text(
                        infoLismonnen.keys.toString(),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

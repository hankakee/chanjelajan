import 'package:flutter/material.dart';

class LisMonen extends StatefulWidget {
  const LisMonen({Key? key}) : super(key: key);

  @override
  State<LisMonen> createState() => _LisMonenState();
}

class _LisMonenState extends State<LisMonen> {
  var infoLismonnen = {
    "CUC": "Cuban Convertible Peso",
    "CVE": "Cape Verdean Escudo"
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
                      leading: const Icon(Icons.monetization_on_outlined),
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

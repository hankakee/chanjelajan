import 'package:flutter/material.dart';

class Istorikmonen extends StatefulWidget {
  const Istorikmonen({Key? key}) : super(key: key);

  @override
  State<Istorikmonen> createState() => _IstorikmonenState();
}

class _IstorikmonenState extends State<Istorikmonen> {
  // var infoistorik = {
  //   "id": 1,
  //   "datecomplete": "2022-08-26",
  //   "fromqty": 1,
  //   "toqty": 1,
  //   "fromcurrency": 1,
  //   "tocurrency": 1
  // };

  List<Map<String, dynamic>> historyData = [
    {
      "id": 1,
      "datecomplete": "2022-06-03",
      "fromqty": 9,
      "toqty": 31,
      "fromcurrency": "NZD",
      "tocurrency": "CNY"
    },
    {
      "id": 2,
      "datecomplete": "2022-07-07",
      "fromqty": 70,
      "toqty": 87,
      "fromcurrency": "KZT",
      "tocurrency": "CNY"
    },
    {
      "id": 3,
      "datecomplete": "2021-10-23",
      "fromqty": 64,
      "toqty": 86,
      "fromcurrency": "CUP",
      "tocurrency": "CNY"
    },
    {
      "id": 4,
      "datecomplete": "2022-03-18",
      "fromqty": 51,
      "toqty": 86,
      "fromcurrency": "XOF",
      "tocurrency": "CNY"
    },
    {
      "id": 5,
      "datecomplete": "2022-03-03",
      "fromqty": 16,
      "toqty": 1,
      "fromcurrency": "KZT",
      "tocurrency": "EUR"
    },
    {
      "id": 6,
      "datecomplete": "2022-03-11",
      "fromqty": 82,
      "toqty": 42,
      "fromcurrency": "IDR",
      "tocurrency": "CNY"
    },
    {
      "id": 7,
      "datecomplete": "2021-12-03",
      "fromqty": 92,
      "toqty": 17,
      "fromcurrency": "ARS",
      "tocurrency": "IDR"
    },
    {
      "id": 8,
      "datecomplete": "2022-02-19",
      "fromqty": 97,
      "toqty": 69,
      "fromcurrency": "PLN",
      "tocurrency": "GTQ"
    },
    {
      "id": 9,
      "datecomplete": "2022-07-11",
      "fromqty": 2,
      "toqty": 36,
      "fromcurrency": "PHP",
      "tocurrency": "CUP"
    },
    {
      "id": 10,
      "datecomplete": "2022-01-03",
      "fromqty": 71,
      "toqty": 25,
      "fromcurrency": "TJS",
      "tocurrency": "CNY"
    }
  ];

  // {success: true, query: {from: USD, to: HTG, amount: 10}, info: {timestamp: 1661537045, rate: 126.598354}, date: 2022-08-26, result: 1265.98354}
// 6 avril 2022
// 2USD - 240 HTG
  Widget cardCurrencies(dataset) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Text(dataset['datecomplete'].toString())),
            Container(
              width: double.infinity,
              child: Text(dataset['fromqty'].toString() +
                  " " +
                  dataset['fromcurrency'] +
                  "  -  " +
                  dataset['toqty'].toString() +
                  " " +
                  dataset['tocurrency']),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Istorik",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // margin: const EdgeInsets.only(top: 20.0),
          // color: Colors.red,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xffe91e63), Color(0xff9c27b0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          height: MediaQuery.of(context).size.height * 3,
          child: Column(
              children: historyData.map((el) => cardCurrencies(el)).toList()),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/istorik.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'dart:async';
class Istorikmonen extends StatefulWidget {
  const Istorikmonen({Key? key}) : super(key: key);
  @override
  State<Istorikmonen> createState() => _IstorikmonenState();
}

class _IstorikmonenState extends State<Istorikmonen> {
 late List<Map<String,dynamic>> historyData;
 final numberFormat = NumberFormat.currency(locale: 'en_US', symbol: '');
 bool isLoading=true;
  @override
  void initState() {
    // initializeDateFormatting();
    // dateFormat = DateFormat.yMMMMd('cs');
    getHistoryData();
    super.initState();
  }

  void getHistoryData() async{
    setState(() => {isLoading=true});
    List <Istorik> historicdt= await Istorik.getHistoric();
    List <Map<String, dynamic>> tmpIstorik=[];
    for (var k = 0; k < historicdt.length; k++) {
      tmpIstorik.add({
        "id": historicdt[k].toMap()['id'],
        "datecomplete":historicdt[k].toMap()['datecomplete'],
        "fromqty": historicdt[k].toMap()['fromqty'],
        "toqty":historicdt[k].toMap()['toqty'],
        "fromcurrency":historicdt[k].toMap()['fromcurrency'],
        "tocurrency":historicdt[k].toMap()['tocurrency']
      });
     // print(historicdt[0].toMap());
    }
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => {historyData = tmpIstorik, isLoading = false});
      }
    });

  }


  // {success: true, query: {from: USD, to: HTG, amount: 10}, info: {timestamp: 1661537045, rate: 126.598354}, date: 2022-08-26, result: 1265.98354}
// 6 avril 2022
// 2USD - 240 HTG
  Widget cardCurrencies(dataset) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
          // Text(dataset.toString()),
            Container(
                width: double.infinity,
                child: Text(
                    DateFormat.yMMMMd()
                        .format(DateTime.parse(dataset['datecomplete']))+" "+DateFormat.jms().format(DateTime.parse(dataset['datecomplete'])),
                    style: const TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))),
            Container(
              width: double.infinity,
              child: Text(
                numberFormat.format(dataset['fromqty']) +
                      " " +
                      dataset['fromcurrency'] +
                      "  -  " +
                      numberFormat.format(dataset['toqty']) +
                      " " +
                      dataset['tocurrency'],
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

Widget skeletonLoading(){
  return Container(
      width: double.infinity,
      padding:const EdgeInsets.all(10.0),
      margin:const EdgeInsets.all(10.0),
      child: Column(children: [
        Container(
          margin:const EdgeInsets.only(top:5),
          alignment: Alignment.centerLeft,
          child: SkeletonAnimation(
            shimmerDuration : 5000,
            borderRadius: BorderRadius.circular(5.0),
            shimmerColor: const Color(0XFFDEDFE0),
            child: Container(
              width: 150.0,
              height: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[200]),
            ),),
        ),  Container(
          alignment: Alignment.centerLeft,
          margin:const EdgeInsets.only(top:5),
          child: SkeletonAnimation(
            shimmerDuration : 4000,
            borderRadius: BorderRadius.circular(10.0),
            shimmerColor:const Color(0XFFDEDFE0),
            child: Container(
              width: 350.0,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[200]),
            ),),
        ),
      ],),color:Colors.grey[50]);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Istorik",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 28.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          getHistoryData();
          print("refresh with success");
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 6.0),
            color: Colors.white,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //   colors: [Color(0xffe91e63), Colors.blue],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // )),
            height: MediaQuery.of(context).size.height * 6,
            child: Column(
                children:isLoading ? List.generate(10,(index){return skeletonLoading();})
                    :   historyData.map((el) => cardCurrencies(el)).toList()
            ),
          ),
        ),
      ),
    );
  }
}

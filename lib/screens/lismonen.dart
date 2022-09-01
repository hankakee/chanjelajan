import 'package:chanjelajan/models/currencies.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'dart:async';
class LisMonen extends StatefulWidget {
  const LisMonen({Key? key}) : super(key: key);

  @override
  State<LisMonen> createState() => _LisMonenState();
}

class _LisMonenState extends State<LisMonen> {
  late List<String> monenyo=[];
  bool isLoading=true;

   void getCurrencies()async{
     setState(() => {isLoading=true});
     var tmpmoney=await Currency.getListCurrencies();
     Timer(const Duration(seconds: 2), () {
       if (mounted) {
         setState(() {
           monenyo = tmpmoney;
           isLoading = false;
         });
       }
     });
     print(monenyo);
   }

   @override
    void initState(){
      getCurrencies();
    }


  Widget cardListCurrencies(dataset) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                child: Text("USD",
                    style: const TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey))),
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
        child: Row(
          children: [
          Container(
            margin:const EdgeInsets.only(top:5),
            alignment: Alignment.centerLeft,
            child: SkeletonAnimation(
              shimmerDuration : 5000,
              borderRadius: BorderRadius.circular(5.0),
              shimmerColor: const Color(0XFFDEDFE0),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey[200]),
              ),),
          ),  Container(
            alignment: Alignment.centerLeft,
            margin:const EdgeInsets.only(top:5,left:20.0),
           child:Column(children: [
              SkeletonAnimation(
                shimmerDuration : 4100,
                borderRadius: BorderRadius.circular(10.0),
                shimmerColor:const Color(0XFFDEDFE0),
                child: Container(
                  width: 250.0,
                  height: 18,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200]),
                ),),
             const SizedBox(width: 220,height: 13,),
             SkeletonAnimation(
               shimmerDuration : 3000,
               borderRadius: BorderRadius.circular(10.0),
               shimmerColor:const Color(0XFFDEDFE0),
               child: Container(
                 width: 250.0,
                 height: 18,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     color: Colors.grey[200]),
               ),),
            ]),
          ),
        ],),color:Colors.grey[50]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Lis monen",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async {
          getCurrencies();
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children:isLoading?List.generate(10,(index){return skeletonLoading();}): List.generate(
                monenyo.length,
                (index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: const Icon(Icons.monetization_on_outlined),
                          title: Text(
                            monenyo[index],
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0XFFC64595)),
                          ),
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}

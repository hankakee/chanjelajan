import 'package:chanjelajan/models/currencies.dart';
import 'package:chanjelajan/screens/lismonen.dart';
import 'package:chanjelajan/service/api.dart';
import 'package:chanjelajan/service/server_config.dart';
import 'package:chanjelajan/service/storage.dart';
import 'package:flutter/material.dart';
import 'utils/alerts.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainChange());
}

class MainChange extends StatelessWidget {
  const MainChange({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chanje lajan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Chanje lajan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;
  String valueOrigin = "";
  double destinationFound = 0;
  Color primarycolor = Color(0XFFC64595);
  TextEditingController originTyped = TextEditingController();

  late List<String> tabCurrencies = ["HTG", "USD", "CAD"];
  String dropdownDestination = 'One';
  String dropdownOrigin = "";
  bool loadedCurrencies = false;
  final numberFormat = NumberFormat.currency(locale: 'en_US', symbol: '');
  @override
  void initState() {
    getCurrencies();
    super.initState();
  }

  void _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void getCurrencies() async {
    //find if storage has currencies
    var shopcurrecies = await Storage.storedCurrencies();
    print(shopcurrecies);
    if (shopcurrecies.isNotEmpty) {
      print('Loaded from storage');
      List<String> simplenewtab = [];
      for (var k = 0; k < shopcurrecies.length; k++) {
        simplenewtab.add(shopcurrecies[k].toString());
      }
      setState(() {
        tabCurrencies = simplenewtab;
        dropdownOrigin = "USD";
        dropdownDestination = "HTG";
        loadedCurrencies = true;
      });
      return;
    }
    print('Loaded from storage failed,loaded from API');

    var result = await APIService.get(ServerConfig.apiUrl + "symbols");
    print("----------------  final find currencies v8  -----------");
    List<String> newTab = [];
    var finalresult = Currency.fromJson(result);
    finalresult.forEach((k, v) => {newTab.add(k)});
    print("finalresult");
    // print("-----------------------tabCurrencies-----------------");
    print(tabCurrencies);
    print(newTab);
    print("loadedCurrencies");
    print(loadedCurrencies);
    setState(() {
      tabCurrencies = newTab;
      // dropdownOrigin = tabCurrencies[0];
      // dropdownDestination = tabCurrencies[0];
      dropdownOrigin = "USD";
      dropdownDestination = "HTG";
      loadedCurrencies = true;
    });
    Storage.writeCurrencies(newTab);
  }

  void setValueOrigin(val) {
    if (val == "C") {
      setState(() {
        originTyped.text = "";
        destinationFound = 0;
      });
    } else if (val == ".") {
      if (originTyped.text != "") {
        if (!originTyped.text.contains(".")) {
          setState(() {
            originTyped.text += val.toString();
          });
        }
      }
    } else {
      setState(() {
        originTyped.text += val.toString();
      });
    }
  }

  void clearFields() {
    setState(() {
      destinationFound = 0;
    });
  }

  void _konveti(context) async {
    try {
      if (originTyped.text == "") {
        Alerts.toast(context, "Danje",
            "Ou sipoze antre on kantite pou konvesyon an fèt!!");
      } else {
        double parsedPriceOrigin = double.parse(originTyped.text);

        if (parsedPriceOrigin <= 0) {
          Alerts.toast(context, "Erè", "Dezole,pa gen konvesyon zero");
          return;
        }
        if (parsedPriceOrigin > 999999999) {
          Alerts.toast(context, "Danje",
              "Aplikasyon an poko ka konvèti tou kob sa,tan'n on lot vèsyon...");
          return;
        }
        print(parsedPriceOrigin);
        if (dropdownOrigin == "" || dropdownDestination == "") {
          Alerts.toast(context, "Erè",
              "Domaj ou sipoze chwazi monen pou'w konveti'l...Cheke entenèt ou oubyen rale ekran an desan' pou'w rafrechi...");
          return;
        } else if (dropdownOrigin == dropdownDestination) {
          Alerts.toast(context, "", "Ou rechwazi anko wi frem");
          setState(() {
            destinationFound = parsedPriceOrigin;
          });
          return;
        } else {
          //TODO call convert endpoint
          // https://api.apilayer.com/exchangerates_data/convert?to={to}&from={from}&amount={amount}
          // destinationFound
          // dropdownOrigin
          var resultConvert = await APIService.get(ServerConfig.apiUrl +
              "convert?to=" +
              dropdownDestination +
              "&from=" +
              dropdownOrigin +
              "&amount=" +
              parsedPriceOrigin.toString());
          print("from:  " + dropdownOrigin + " to: " + dropdownDestination);
          print(json.decode(resultConvert));
          var finalConvert = json.decode(resultConvert);
          setState(() {
            destinationFound = finalConvert['result'];
            print(finalConvert['result']);
          });
        }
      }
    } catch (e) {
      // print(e);
      Alerts.toast(context, "Erè", "Domaj saw antre a pa bon");
      print("error catched calling api konveti " + e.toString());
    }

    // print(destinationFound);
  }

  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    List<int> firstrow = [7, 8, 9];
    List<int> secondrow = [4, 5, 6];
    List<int> thirdrow = [1, 2, 3];
    List<String> lastrow = ["C", "0", "."];

    return Scaffold(
      body: Center(
          child: selectedIndex == 1
              ? !loadedCurrencies
                  ? Center(
                      child: CircularProgressIndicator(
                        color: primarycolor,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        // height: heightscreen,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const SizedBox(),
                            const Spacer(),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  //dropdown search
                                  Expanded(
                                    child: Container(
                                      width: 120.0,
                                      // color: Colors.red,
                                      child: DropdownButton<String>(
                                        underline: const SizedBox(),
                                        value: dropdownOrigin,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 24,
                                        ),
                                        // elevation: 50,
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 24),
                                        items: tabCurrencies
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                textAlign: TextAlign.right),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          clearFields();
                                          setState(() {
                                            dropdownOrigin = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.centerRight,
                                      // color: Colors.amber,
                                      child: DropdownButton<String>(
                                        value: dropdownDestination,
                                        underline: const SizedBox(),
                                        alignment:
                                            AlignmentDirectional.bottomEnd,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 24,
                                        ),
                                        // elevation: 50,
                                        style: TextStyle(
                                            color: primarycolor, fontSize: 24),
                                        items: tabCurrencies
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                textAlign: TextAlign.center),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          clearFields();
                                          setState(() {
                                            dropdownDestination = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 30.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      showCursor: false,
                                      readOnly: true,
                                      controller: originTyped,
                                      decoration: InputDecoration(
                                        border: const UnderlineInputBorder(),
                                        labelText: 'Kantite ' + dropdownOrigin,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(numberFormat.format(destinationFound),
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: primarycolor,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.all(5.0),
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: primarycolor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(children: [
                                  Container(
                                    child: Row(
                                        children: List.generate(firstrow.length,
                                            (index) {
                                      return Expanded(
                                          child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          child: Text(
                                            firstrow[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 28.0),
                                          ),
                                          onPressed: () {
                                            setValueOrigin(firstrow[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: primarycolor,
                                              side: BorderSide(
                                                width: 0,
                                                color: primarycolor,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero))),
                                        ),
                                      ));
                                    })),
                                  ),
                                  Container(
                                    child: Row(
                                        children: List.generate(
                                            secondrow.length, (index) {
                                      return Expanded(
                                          child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          child: Text(
                                            secondrow[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 28.0),
                                          ),
                                          onPressed: () {
                                            setValueOrigin(secondrow[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: primarycolor,
                                              side: BorderSide(
                                                width: 0,
                                                color: primarycolor,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero))),
                                        ),
                                      ));
                                    })),
                                  ),
                                  Container(
                                    child: Row(
                                        children: List.generate(thirdrow.length,
                                            (index) {
                                      return Expanded(
                                          child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          child: Text(
                                            thirdrow[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 28.0),
                                          ),
                                          onPressed: () {
                                            setValueOrigin(thirdrow[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: primarycolor,
                                              side: BorderSide(
                                                width: 0,
                                                color: primarycolor,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero))),
                                        ),
                                      ));
                                    })),
                                  ),
                                  Container(
                                    child: Row(
                                        children: List.generate(lastrow.length,
                                            (index) {
                                      return Expanded(
                                          child: Container(
                                        height: 50,
                                        child: ElevatedButton(
                                          child: Text(
                                            lastrow[index].toString(),
                                            style:
                                                const TextStyle(fontSize: 28.0),
                                          ),
                                          onPressed: () {
                                            setValueOrigin(lastrow[index]);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: primarycolor,
                                              side: BorderSide(
                                                width: 0,
                                                color: primarycolor,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.zero))),
                                        ),
                                      ));
                                    })),
                                  ),
                                ])),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20.0, bottom: 20.0),
                              width: double.infinity,
                              child: SizedBox(
                                height: 60.0,
                                child: TextButton(
                                    child: const Text(
                                      "Konveti",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                        padding:
                                            MaterialStateProperty.all<EdgeInsets>(
                                                const EdgeInsets.all(0)),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                primarycolor),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromRGBO(
                                                    255, 255, 255, 1)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7.0),
                                                side: const BorderSide(color: Color.fromARGB(255, 173, 173, 173))))),
                                    onPressed: () {
                                      _konveti(context);
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
              : (selectedIndex == 0 ? const LisMonen() : const Text("Monen"))),
      bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: const Color(0XFFEC3496),
          // type: BottomNavigationBarType.shifting,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt_outlined,
                size: 28,
              ),
              label: 'lis monnen',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
                size: 28,
              ),
              label: 'akey',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.change_circle_outlined,
                size: 28,
              ),
              label: 'monnen',
            ),
          ],
          selectedItemColor: const Color(0XFFEC3496),
          unselectedItemColor: Colors.grey[400],
          currentIndex: selectedIndex,
          onTap: _changeIndex),
    );
  }
}

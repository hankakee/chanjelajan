import 'package:chanjelajan/models/currencies.dart';
import 'package:chanjelajan/service/api.dart';
import 'package:chanjelajan/service/server_config.dart';
import 'package:flutter/material.dart';
import 'utils/alerts.dart';

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
  String dropdownDestination = 'One';
  String valueOrigin = "";
  double destinationFound = 0;
  Color primarycolor = Color(0XFFC64595);
  TextEditingController originTyped = TextEditingController();

  late List<String> tabCurrencies = ["HTG", "USD", "CAD"];
  String dropdownOrigin = "";
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
    var result = await APIService.get(ServerConfig.apiUrl + "symbols");
    var testjson = {
      "success": true,
      "symbols": {
        "AED": "United Arab Emirates Dirham",
        "AFN": "Afghan Afghani",
        "ALL": "Albanian Lek",
        "AMD": "Armenian Dram",
        "ANG": "Netherlands Antillean Guilder",
        "AOA": "Angolan Kwanza",
        "ARS": "Argentine Peso",
        "AUD": "Australian Dollar",
        "AWG": "Aruban Florin",
        "AZN": "Azerbaijani Manat",
        "BAM": "Bosnia-Herzegovina Convertible Mark",
        "BBD": "Barbadian Dollar",
        "BDT": "Bangladeshi Taka",
        "BGN": "Bulgarian Lev",
        "BHD": "Bahraini Dinar",
        "BIF": "Burundian Franc",
        "BMD": "Bermudan Dollar",
        "BND": "Brunei Dollar",
        "BOB": "Bolivian Boliviano",
        "BRL": "Brazilian Real",
        "BSD": "Bahamian Dollar",
        "BTC": "Bitcoin",
        "BTN": "Bhutanese Ngultrum",
        "BWP": "Botswanan Pula",
        "BYN": "New Belarusian Ruble",
        "BYR": "Belarusian Ruble",
        "BZD": "Belize Dollar",
        "CAD": "Canadian Dollar",
        "CDF": "Congolese Franc",
        "CHF": "Swiss Franc",
        "CLF": "Chilean Unit of Account (UF)",
        "CLP": "Chilean Peso",
        "CNY": "Chinese Yuan",
        "COP": "Colombian Peso",
        "CRC": "Costa Rican Col\u00f3n",
        "CUC": "Cuban Convertible Peso",
        "CUP": "Cuban Peso",
        "CVE": "Cape Verdean Escudo",
        "CZK": "Czech Republic Koruna",
        "DJF": "Djiboutian Franc",
        "DKK": "Danish Krone",
        "DOP": "Dominican Peso",
        "DZD": "Algerian Dinar",
        "EGP": "Egyptian Pound",
        "ERN": "Eritrean Nakfa",
        "ETB": "Ethiopian Birr",
        "EUR": "Euro",
        "FJD": "Fijian Dollar",
        "FKP": "Falkland Islands Pound",
        "GBP": "British Pound Sterling",
        "GEL": "Georgian Lari",
        "GGP": "Guernsey Pound",
        "GHS": "Ghanaian Cedi",
        "GIP": "Gibraltar Pound",
        "GMD": "Gambian Dalasi",
        "GNF": "Guinean Franc",
        "GTQ": "Guatemalan Quetzal",
        "GYD": "Guyanaese Dollar",
        "HKD": "Hong Kong Dollar",
        "HNL": "Honduran Lempira",
        "HRK": "Croatian Kuna",
        "HTG": "Haitian Gourde",
        "HUF": "Hungarian Forint",
        "IDR": "Indonesian Rupiah",
        "ILS": "Israeli New Sheqel",
        "IMP": "Manx pound",
        "INR": "Indian Rupee",
        "IQD": "Iraqi Dinar",
        "IRR": "Iranian Rial",
        "ISK": "Icelandic Kr\u00f3na",
        "JEP": "Jersey Pound",
        "JMD": "Jamaican Dollar",
        "JOD": "Jordanian Dinar",
        "JPY": "Japanese Yen",
        "KES": "Kenyan Shilling",
        "KGS": "Kyrgystani Som",
        "KHR": "Cambodian Riel",
        "KMF": "Comorian Franc",
        "KPW": "North Korean Won",
        "KRW": "South Korean Won",
        "KWD": "Kuwaiti Dinar",
        "KYD": "Cayman Islands Dollar",
        "KZT": "Kazakhstani Tenge",
        "LAK": "Laotian Kip",
        "LBP": "Lebanese Pound",
        "LKR": "Sri Lankan Rupee",
        "LRD": "Liberian Dollar",
        "LSL": "Lesotho Loti",
        "LTL": "Lithuanian Litas",
        "LVL": "Latvian Lats",
        "LYD": "Libyan Dinar",
        "MAD": "Moroccan Dirham",
        "MDL": "Moldovan Leu",
        "MGA": "Malagasy Ariary",
        "MKD": "Macedonian Denar",
        "MMK": "Myanma Kyat",
        "MNT": "Mongolian Tugrik",
        "MOP": "Macanese Pataca",
        "MRO": "Mauritanian Ouguiya",
        "MUR": "Mauritian Rupee",
        "MVR": "Maldivian Rufiyaa",
        "MWK": "Malawian Kwacha",
        "MXN": "Mexican Peso",
        "MYR": "Malaysian Ringgit",
        "MZN": "Mozambican Metical",
        "NAD": "Namibian Dollar",
        "NGN": "Nigerian Naira",
        "NIO": "Nicaraguan C\u00f3rdoba",
        "NOK": "Norwegian Krone",
        "NPR": "Nepalese Rupee",
        "NZD": "New Zealand Dollar",
        "OMR": "Omani Rial",
        "PAB": "Panamanian Balboa",
        "PEN": "Peruvian Nuevo Sol",
        "PGK": "Papua New Guinean Kina",
        "PHP": "Philippine Peso",
        "PKR": "Pakistani Rupee",
        "PLN": "Polish Zloty",
        "PYG": "Paraguayan Guarani",
        "QAR": "Qatari Rial",
        "RON": "Romanian Leu",
        "RSD": "Serbian Dinar",
        "RUB": "Russian Ruble",
        "RWF": "Rwandan Franc",
        "SAR": "Saudi Riyal",
        "SBD": "Solomon Islands Dollar",
        "SCR": "Seychellois Rupee",
        "SDG": "Sudanese Pound",
        "SEK": "Swedish Krona",
        "SGD": "Singapore Dollar",
        "SHP": "Saint Helena Pound",
        "SLL": "Sierra Leonean Leone",
        "SOS": "Somali Shilling",
        "SRD": "Surinamese Dollar",
        "STD": "S\u00e3o Tom\u00e9 and Pr\u00edncipe Dobra",
        "SVC": "Salvadoran Col\u00f3n",
        "SYP": "Syrian Pound",
        "SZL": "Swazi Lilangeni",
        "THB": "Thai Baht",
        "TJS": "Tajikistani Somoni",
        "TMT": "Turkmenistani Manat",
        "TND": "Tunisian Dinar",
        "TOP": "Tongan Pa\u02bbanga",
        "TRY": "Turkish Lira",
        "TTD": "Trinidad and Tobago Dollar",
        "TWD": "New Taiwan Dollar",
        "TZS": "Tanzanian Shilling",
        "UAH": "Ukrainian Hryvnia",
        "UGX": "Ugandan Shilling",
        "USD": "United States Dollar",
        "UYU": "Uruguayan Peso",
        "UZS": "Uzbekistan Som",
        "VEF": "Venezuelan Bol\u00edvar Fuerte",
        "VND": "Vietnamese Dong",
        "VUV": "Vanuatu Vatu",
        "WST": "Samoan Tala",
        "XAF": "CFA Franc BEAC",
        "XAG": "Silver (troy ounce)",
        "XAU": "Gold (troy ounce)",
        "XCD": "East Caribbean Dollar",
        "XDR": "Special Drawing Rights",
        "XOF": "CFA Franc BCEAO",
        "XPF": "CFP Franc",
        "YER": "Yemeni Rial",
        "ZAR": "South African Rand",
        "ZMK": "Zambian Kwacha (pre-2013)",
        "ZMW": "Zambian Kwacha",
        "ZWL": "Zimbabwean Dollar"
      }
    };
    print("----------------  final find currencies v7  -----------");
    List<String> newTab = [];
    var finalresult = Currency.fromJson(testjson);
    finalresult.forEach((k, v) => {newTab.add(k)});
    // print("finalresult");
    // print(finalresult);
    // print("-----------------------tabCurrencies-----------------");
    // print(tabCurrencies);
    // print(newTab);
    // tabCurrencies = newTab;
    setState(() {
      tabCurrencies = newTab;
      dropdownOrigin = tabCurrencies[0];
    });
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

  void _konveti(context) {
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
        setState(() {
          destinationFound = parsedPriceOrigin;
        });
      }
    } catch (e) {
      print("error catched calling api konveti " + e.toString());
    }

    print(destinationFound);
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
              ? Container(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: heightscreen,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.blue,
                          // padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Row(
                            children: <Widget>[
                              //dropdown search
                              // dropdown_search

                              // SizedBox(
                              //   width: 120.0,
                              //   child: DropdownButton<String>(
                              //     value: dropdownOrigin,
                              //     icon: const Icon(
                              //       Icons.keyboard_arrow_down_outlined,
                              //       size: 24,
                              //     ),
                              //     // elevation: 50,
                              //     style: const TextStyle(
                              //         color: Colors.blue, fontSize: 20),
                              //     items: tabCurrencies
                              //         .map<DropdownMenuItem<String>>(
                              //             (String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value),
                              //       );
                              //     }).toList(),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         dropdownOrigin = newValue!;
                              //       });
                              //     },
                              //   ),
                              // ),

                              // const Spacer(),
                              // SizedBox(
                              //   width: 120,
                              //   child: DropdownButtonFormField<String>(
                              //     value: dropdownDestination,
                              //     icon: const Icon(
                              //       Icons.keyboard_arrow_down_outlined,
                              //       size: 28,
                              //     ),
                              //     elevation: 50,
                              //     style: const TextStyle(
                              //         color: Colors.blue, fontSize: 20),
                              //     decoration: InputDecoration(
                              //         enabledBorder: OutlineInputBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(12.0),
                              //             borderSide: const BorderSide(
                              //                 width: 2, color: Colors.blue))),
                              //     onChanged: (String? newValue) {
                              //       setState(() {
                              //         dropdownDestination = newValue!;
                              //       });
                              //     },
                              //     items: <String>['One', 'Two', 'Free', 'Four']
                              //         .map<DropdownMenuItem<String>>(
                              //             (String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          padding:
                              const EdgeInsets.only(top: 50.0, bottom: 20.0),
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
                              Container(
                                  child: Text(destinationFound.toString(),
                                      style: const TextStyle(fontSize: 28)))
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: primarycolor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(children: [
                              Container(
                                child: Row(
                                    children:
                                        List.generate(firstrow.length, (index) {
                                  return Expanded(
                                      child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Text(
                                        firstrow[index].toString(),
                                        style: const TextStyle(fontSize: 28.0),
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                  ));
                                })),
                              ),
                              Container(
                                child: Row(
                                    children: List.generate(secondrow.length,
                                        (index) {
                                  return Expanded(
                                      child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Text(
                                        secondrow[index].toString(),
                                        style: const TextStyle(fontSize: 28.0),
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                  ));
                                })),
                              ),
                              Container(
                                child: Row(
                                    children:
                                        List.generate(thirdrow.length, (index) {
                                  return Expanded(
                                      child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Text(
                                        thirdrow[index].toString(),
                                        style: const TextStyle(fontSize: 28.0),
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                  ));
                                })),
                              ),
                              Container(
                                child: Row(
                                    children:
                                        List.generate(lastrow.length, (index) {
                                  return Expanded(
                                      child: Container(
                                    height: 50,
                                    child: ElevatedButton(
                                      child: Text(
                                        lastrow[index].toString(),
                                        style: const TextStyle(fontSize: 28.0),
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.zero))),
                                    ),
                                  ));
                                })),
                              ),
                            ])),
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
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
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                        const Color.fromRGBO(255, 255, 255, 1)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            side: const BorderSide(
                                                color: Color.fromARGB(255, 173, 173, 173))))),
                                onPressed: () {
                                  _konveti(context);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : (selectedIndex == 0 ? Text("Lis monen") : Text("Monen"))),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0XFFEC3496),
          type: BottomNavigationBarType.shifting,
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

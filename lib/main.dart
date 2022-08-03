import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  int _counter = 0;
  int selectedIndex = 1;
  String dropdownOrigin = 'One';
  String dropdownDestination = 'One';
  String valueOrigin = "";
  double destinationFound = 0;
  Color primarycolor = Color(0XFFC64595);
  TextEditingController originTyped = TextEditingController();
  void _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
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

  void _konveti() {
    double parsedPriceOrigin = double.parse(originTyped.text);
    print(parsedPriceOrigin);
    setState(() {
      destinationFound = parsedPriceOrigin;
    });
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
                              SizedBox(
                                width: 120.0,
                                child: DropdownButtonFormField<String>(
                                  value: dropdownOrigin,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 24,
                                  ),
                                  // elevation: 50,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.blue))),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownOrigin = newValue!;
                                    });
                                  },
                                  items: <String>['One', 'Two', 'Free', 'Four']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 120,
                                child: DropdownButtonFormField<String>(
                                  value: dropdownDestination,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 28,
                                  ),
                                  elevation: 50,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: const BorderSide(
                                              width: 2, color: Colors.blue))),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownDestination = newValue!;
                                    });
                                  },
                                  items: <String>['One', 'Two', 'Free', 'Four']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
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
                                onPressed: _konveti),
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

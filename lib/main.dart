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
  TextEditingController firstCurrency = TextEditingController();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
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
        child: Container(
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
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue))),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownOrigin = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
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
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.blue))),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownDestination = newValue!;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
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
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        child: const Text(
                          "323892",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2.0, color: Colors.white),
                            bottom: BorderSide(width: 2.0, color: Colors.black),
                          ),
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Container(
                          child:
                              const Text("0", style: TextStyle(fontSize: 28)))
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(0XFFC64595),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(children: [
                      Container(
                        child: Row(
                            children: List.generate(firstrow.length, (index) {
                          return Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                firstrow[index].toString(),
                                style: const TextStyle(fontSize: 28.0),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0XFFC64595),
                                  side: const BorderSide(
                                    width: 0,
                                    color: Color(0XFFC64595),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero))),
                            ),
                          ));
                        })),
                      ),
                      Container(
                        child: Row(
                            children: List.generate(secondrow.length, (index) {
                          return Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                secondrow[index].toString(),
                                style: const TextStyle(fontSize: 28.0),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0XFFC64595),
                                  side: const BorderSide(
                                    width: 0,
                                    color: Color(0XFFC64595),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero))),
                            ),
                          ));
                        })),
                      ),
                      Container(
                        child: Row(
                            children: List.generate(thirdrow.length, (index) {
                          return Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                thirdrow[index].toString(),
                                style: const TextStyle(fontSize: 28.0),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0XFFC64595),
                                  side: const BorderSide(
                                    width: 0,
                                    color: Color(0XFFC64595),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero))),
                            ),
                          ));
                        })),
                      ),
                      Container(
                        child: Row(
                            children: List.generate(lastrow.length, (index) {
                          return Expanded(
                              child: Container(
                            height: 50,
                            child: ElevatedButton(
                              child: Text(
                                lastrow[index].toString(),
                                style: const TextStyle(fontSize: 28.0),
                              ),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0XFFC64595),
                                  side: const BorderSide(
                                    width: 0,
                                    color: Color(0XFFC64595),
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero))),
                            ),
                          ));
                        })),
                      ),
                    ])),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: double.infinity,
                  child: SizedBox(
                    height: 60.0,
                    child: ElevatedButton(
                      child: Text(
                        "Konveti",
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Color(0XFFC64595),
                          side: const BorderSide(
                            width: 0,
                            color: Color(0XFFC64595),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.zero))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // child:
      ),
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

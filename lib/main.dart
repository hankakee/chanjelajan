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
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
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
                GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[100],
                      child: Center(
                        child: const Text("7"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[200],
                      child: Center(
                        child: const Text('8'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('9'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('6'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('5'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('4'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('3'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('2'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: Colors.teal[300],
                      child: Center(
                        child: const Text('1'),
                      ),
                    ),
                  ],
                )
              ],
            ),
            //  Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ),
        ),
        // child:
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
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

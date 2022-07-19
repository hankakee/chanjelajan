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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Chanje lajan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int selectedIndex = 1;
  String dropdownValue = 'One';
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
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 60.0),
          height: heightscreen,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                // color: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  // shrinkWrap: true,
                  // crossAxisCount: 2,
                  // mainAxisSpacing: 1.0,
                  // crossAxisSpacing: 1.0,
                  // padding: const EdgeInsets.all(0.0),
                  children: <Widget>[
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 24,
                        ),
                        // elevation: 50,
                        style: const TextStyle(
                            color: Colors.deepPurple, fontSize: 28),
                        underline: Container(
                          height: 2,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
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
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 24,
                        ),
                        // elevation: 50,
                        style: const TextStyle(
                            color: Colors.deepPurple, fontSize: 28),
                        underline: Container(
                          height: 2,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
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
                padding:
                    const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: firstCurrency,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        // decoration: const InputDecoration(
                        //   icon: Icon(Icons.lock, color: const Color(0xFF994CFC)),
                        //   // border: InputBorder.none,
                        // ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                        // color: Colors.amber,
                        // padding: const EdgeInsets.only(top: 10.0),
                        child: const Text("0", style: TextStyle(fontSize: 28)))
                  ],
                ),
              )
            ],
          ),
          //  Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
        ),
        // child:
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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

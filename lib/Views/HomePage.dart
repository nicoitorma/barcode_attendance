import 'package:barcode_attendance/Utilities/barcode_scanner.dart';
import 'package:flutter/material.dart';

import '../Resources/constants_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void scanBarcode() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BarcodeScanner()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: const Color.fromARGB(255, 76, 125, 255),
      body: Stack(
        children: <Widget>[
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: EdgeInsets.fromLTRB(45, 80, 0, 0),
              child: Text(
                WELCOME,
                style: TextStyle(fontSize: 40.0, color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 450,
              alignment: AlignmentDirectional.bottomCenter,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: scanBarcode,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

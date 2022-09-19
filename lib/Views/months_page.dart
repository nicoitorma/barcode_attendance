import 'package:barcode_attendance/Views/child_elements/card_grid_view.dart';
import 'package:barcode_attendance/Views/child_elements/page_title.dart';
import 'package:flutter/material.dart';

import '../Resources/colors.dart';

class MonthPage extends StatelessWidget {
  final String title;
  const MonthPage({super.key, required this.title});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MyMonthPage(title: title),
    );
  }
}

class MyMonthPage extends StatefulWidget {
  const MyMonthPage({super.key, required this.title});

  final String? title;

  @override
  State<MyMonthPage> createState() => _MyMonthPageState();
}

class _MyMonthPageState extends State<MyMonthPage> {
  List months = [
    'August',
    'September',
    'October',
    'November',
    'December',
    'January',
    'February',
    'March',
    'April',
    'May'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PageTitle(title: widget.title),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(20),
                alignment: AlignmentDirectional.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: CardGridView(
                  months: months,
                )),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

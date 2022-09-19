import 'package:flutter/material.dart';

import '../Resources/colors.dart';
import '../Resources/constants_strings.dart';

class DaysPage extends StatelessWidget {
  const DaysPage({super.key});

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
      home: const MyDaysPage(title: 'Home Page'),
    );
  }
}

class MyDaysPage extends StatefulWidget {
  const MyDaysPage({super.key, required this.title});

  final String title;

  @override
  State<MyDaysPage> createState() => _MyDaysPageState();
}

class _MyDaysPageState extends State<MyDaysPage> {
  void addSchoolYear() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('FAB Clicked'),
    ));
  }

  final List<Map> schoolYear =
      List.generate(50, (index) => {"id": index, "Name": "SY $index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: const Align(alignment: Alignment.center, child: Text("CALENDAR")),
      floatingActionButton: FloatingActionButton(
        onPressed: addSchoolYear,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

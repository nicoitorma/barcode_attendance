import 'package:barcode_attendance/Views/month_page.dart';
import 'package:flutter/material.dart';

import '../Resources/colors.dart';
import '../Resources/constants_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
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
  List<Map<String, dynamic>> schoolYear = [];

  void addSchoolYear() {
    var schoolYearController = TextEditingController();
    const String scaffoldMsg = "Invalid School Year";

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(10.0),
            content: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Add New School Year",
                      style: TextStyle(fontSize: 18),
                    ),
                    TextField(
                        decoration: const InputDecoration(
                            hintText: 'e.g. 2022-2023',
                            labelText: 'School Year'),
                        controller: schoolYearController,
                        keyboardType: TextInputType.number),
                    ButtonBar(
                      buttonMinWidth: 100,
                      alignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text("Cancel"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        ElevatedButton(
                          onPressed: (() {
                            Navigator.pop(context);
                            if (schoolYearController.text.isNotEmpty) {
                              schoolYear.add({"SY": schoolYearController.text});
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "${schoolYearController.text} is added"),
                                  duration: const Duration(milliseconds: 800)));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(scaffoldMsg),
                                      duration: Duration(milliseconds: 800)));
                            }
                          }),
                          child: const Text("Add"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
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
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.80,
              alignment: AlignmentDirectional.bottomCenter,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: (schoolYear.isEmpty)
                  ? const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "NO AVAILABLE DATA",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 2 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: schoolYear.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MonthPage(title: schoolYear[index]["SY"])),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [GREEN, BLUE]),
                                borderRadius: BorderRadius.circular(18)),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                schoolYear[index]["SY"],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addSchoolYear,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

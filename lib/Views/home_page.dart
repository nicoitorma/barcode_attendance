import 'package:barcode_attendance/Models/DataModels/SchoolYear.dart';
import 'package:barcode_attendance/ViewModels/DataAccessObjects/school_year_dao.dart';
import 'package:barcode_attendance/Views/child_elements/card_grid_view.dart';
import 'package:barcode_attendance/Views/child_elements/page_title.dart';
import 'package:barcode_attendance/Views/months_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../Resources/colors.dart';
import '../Resources/constants_strings.dart';

class HomePage extends StatelessWidget {
  final SchoolYearDao schoolYearDao;

  const HomePage({super.key, required this.schoolYearDao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        schoolYearDao: schoolYearDao,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.schoolYearDao});

  final SchoolYearDao schoolYearDao;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                              widget.schoolYearDao.insertSchoolYear(SchoolYear(
                                  schoolYear:
                                      "SY ${schoolYearController.text}"));
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
                            setState(() {});
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const PageTitle(title: WELCOME),
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
              child: FutureBuilder(
                future: widget.schoolYearDao.getAllSchoolYear(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<SchoolYear>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "NO_AVAILABLE_DATA",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  }
                  return CardGridView(snapshot: snapshot);
                },
              ),
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

import 'package:barcode_attendance/Models/DataModels/Attendance.dart';
import 'package:barcode_attendance/ViewModels/DataAccessObjects/attendance_dao.dart';
import 'package:barcode_attendance/Views/studentPage.dart';
import 'package:barcode_attendance/constants_strings.dart';
import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  final AttendanceDao attendanceDao;

  const AttendancePage({super.key, required this.attendanceDao});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Attendance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAttendancePage(
          title: 'Attendance Page', attendanceDao: attendanceDao),
    );
  }
}

class MyAttendancePage extends StatefulWidget {
  const MyAttendancePage(
      {super.key, required this.title, required this.attendanceDao});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final AttendanceDao attendanceDao;
  final String title;

  @override
  State<MyAttendancePage> createState() => _MyAttendancePageState();
}

class _MyAttendancePageState extends State<MyAttendancePage> {
  /// FUNCTION TO ADD ATTENDANCE IN THE LIST (UNFINISHED - NO INPUT LAYOUT)
  void addAttendance() {
    // SAMPLE ATTENDANCE DATA
    Attendance attendance1 = Attendance(
        name: "VEEEEEEERRRRRRRYYYYY LOOOOOOOONNNNGGGG TITLE",
        details: "details1",
        timeAndDate: "timeAndDate1");

    //calls the DAO to insert the created attendance into DB
    widget.attendanceDao.insertAttendance(attendance1);
    setState(() {}); //reloads the UI state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: widget.attendanceDao.getAllAttendance(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Attendance>> snapshot) {
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text(NO_ATTENDANCE_AVAILABLE));
            }
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Icon(Icons.delete_forever),
                    ),
                    key: ValueKey<int>(snapshot.data![index].id!),
                    onDismissed: (DismissDirection direction) async {
                      await widget.attendanceDao
                          .deleteAttendance(snapshot.data![index].id!);
                      setState(() {
                        snapshot.data!.remove(snapshot.data![index]);
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentPage()));
                      },
                      child: Card(
                          child: ListTile(
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(snapshot.data![index].name),
                        subtitle:
                            Text(snapshot.data![index].details.toString()),
                      )),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addAttendance,
        tooltip: ADD_STUDENT_TOOLTIP,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class Student {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  final int? idNumber;
  final String department;
  final int? studentYear;
  final String? studentBlock;

  //constructor
  Student(this.id,
      {required this.name,
      this.idNumber,
      required this.department,
      this.studentYear,
      this.studentBlock});
}

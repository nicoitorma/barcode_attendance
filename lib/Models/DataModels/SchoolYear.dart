import 'package:floor/floor.dart';

@entity
class SchoolYear {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String schoolYear;

  //constructor
  SchoolYear({this.id, required this.schoolYear});
}

import 'dart:convert';

import 'package:floor/floor.dart';

@entity
class UserAccount {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String password;

  //constructor
  UserAccount(
      {this.id,
        required this.name,
        required this.password});
}
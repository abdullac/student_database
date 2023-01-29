

import 'package:hive_flutter/hive_flutter.dart';

 part 'student_model.g.dart'; 

@HiveType(typeId: 0)
class Student {

  int? sqfliteId;

  @HiveField(0)
  int? hiveId;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String age;

  Student({
    required this.id,
    required this.name,
    required this.age,
    this.hiveId,
    this.sqfliteId,
  });

  static Student fromMap(Map<String, Object?> map){
    int sqfliteId = map["sqfliteid"] as int;
    int id = map["id"] as int;
    String name = map["name"] as String;
    String age = map["age"]as String;  
    return Student(sqfliteId: sqfliteId,id: id, name: name, age: age);
  }
 
}
 
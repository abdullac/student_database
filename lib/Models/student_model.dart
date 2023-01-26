

import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details/main.dart';

 part 'student_model.g.dart'; 

@HiveType(typeId: 0)
class Student {

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
  });

  // addToBox(){
  //   //
  //   box.put('id', id);
  //   box.put('name', name);
  //   box.put('age', age);
  // }

  // getFromBox(int index){
  //   //
  //   Map<String, dynamic> studentMap;
  //   return studentMap = {
  //     "roll": index + 1,
  //     "id": box.get[index],
  //     "name": box.get[index],
  //     "age": box.get[index],
  //   };
  // }

  // updateToBox(){
  //   //
  // }

  // deleteFromBox(){
  //   //
  // }

 
}

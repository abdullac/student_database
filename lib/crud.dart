

// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:student_details/Models/student_model.dart';
// import 'package:student_details/functions/crud.dart';
// import 'package:student_details/widgets/add_student.dart';
// import 'package:student_details/widgets/list_students.dart';



// String boxName = 'studentDB';

// class Crud {
//   //  final int id;
//   // final String name;
//   // final String age;
//   Student? student;
//   Crud({this.student, 
//     // required this.id,
//     // required this.name,
//     // required this.age,
//   }){
//     if(student !=null){
//       student = student!;
//     }
//   }


// // // without storage, Database
// //    addStudentData() {
// //     idList.add(id);
// //     nameList.add(name);
// //     ageList.add(age);
// //     listNotifier.value = nameList.length;
// //     nameEditingController.text = "";
// //     ageEditingController.text = "";
// //   }

// //   Map<String, dynamic> desplayListStudent(index) {
// //     Map<String, dynamic> studentMap;
// //     return studentMap = {
// //       "roll": index + 1,
// //       "id": idList[index],
// //       "name": nameList[index],
// //       "age": ageList[index],
// //     };
// //   }

// //   deleteStudentData(int id) {
// //     int position = idList.indexOf(id);
// //     position != -1 ? removeData(position) : print("cannot delete, not find");
// //     listNotifier.value = nameList.length;
// //   }

// //   removeData(position) {
// //     idList.removeAt(position);
// //     nameList.removeAt(position);
// //     ageList.removeAt(position);
// //   }

// //   updateData() {
// //     int position = idList.indexOf(id);
// //     nameList[position] = name;
// //     ageList[position] = age;
// //     updateButtonNotifier.value = false;
// //     listNotifier.value = nameList.length - 1;
// //     listNotifier.value = nameList.length;
// //   }

// // hive storage, Database

// addStudentToBox() async {
//     final studentDB = await Hive.openBox<Student>(boxName);
//     //Student studentData = Student(id: id, name: name, age: age);
//     int hiveId = await studentDB.add(student!);
//     student!.hiveId = hiveId;
//     updateId= student!.hiveId!;
//     studentListNotifier.value.add(student!);
//      studentListNotifier.notifyListeners();
//     //getAllStudentsFromBox();
//     // studentDB.clear(); // Delete all data from Box.
//     nameEditingController.text = "";
//     ageEditingController.text = "";
//   }

//   getAllStudentsFromBox() async {
//     final studentDB = await Hive.openBox<Student>(boxName);
//     //Student studentData = Student(id: id, name: name, age: age);
//     studentListNotifier.value.clear();
//     studentListNotifier.value.addAll(studentDB.values);
//     studentListNotifier.notifyListeners();
//     //studentDB.clear(); // Delete all data from Box.
//   }

//   deleteStudentFromBox(int hiveId) async {
//     print("hivee idd $hiveId");
//     final studentDB = await Hive.openBox<Student>(boxName);
//     studentDB.delete(hiveId);
//     getAllStudentsFromBox();
//   }

//   updateStudentToBox(int hiveId) async {
//     final studentDB = await Hive.openBox<Student>(boxName);
//     //Student studentData = Student(id: id, name: name, age: age);
//     studentListNotifier.value.clear();
//     print("update hiveId $hiveId");
//     studentDB.put(hiveId, student!);
//     getAllStudentsFromBox();
//     updateButtonNotifier.value = false;
//     nameEditingController.text = "";
//     ageEditingController.text = "";
//   }






// }
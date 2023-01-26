import 'package:flutter/material.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/list_students.dart';

final nameEditingController = TextEditingController();
final ageEditingController = TextEditingController();
final updateButtonNotifier = ValueNotifier(false);

class AddStudent extends StatelessWidget {
  const AddStudent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.orange[600],
      child: Column(
        children: [
          const Text(
            "ADD STUDENT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text("       Student Name"),
            subtitle: TextField(
              controller: nameEditingController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text("       Student Age"),
            subtitle: TextField(
              controller: ageEditingController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              //
              saveOrUpdataeData();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
            child: const SaveButtonText(),
          ),
        ],
      ),
    );
  }

  saveOrUpdataeData() {
    int id = updateButtonNotifier.value != true
        ? studentListNotifier.value.isNotEmpty
            ? studentListNotifier.value.last.id + 1
            : 0
        : updateId;
    int hiveId = -4;
     if (dataBaseType == DataBaseType.hive) {
      if(updateButtonNotifier.value != true){
        print("hive id will autaomatically add to hive database");
      }else{
        hiveId = updateHiveId;
      }
     }else{
      hiveId = -3;
     }
    String name = nameEditingController.text;
    String age = ageEditingController.text;
    if((name != null && name.isNotEmpty) && (age != null && age.isNotEmpty)){
    Student student = Student(id: id, name: name, age: age);
    if (updateButtonNotifier.value != true) {
      add(student);
    } else {
      if (dataBaseType == DataBaseType.hive) {
        update(primaryIndex: hiveId, student: student);
      } else if (dataBaseType == DataBaseType.variable) {
        update(primaryIndex: id, student: student);
      }
    }
    }else{
      print("student name or age is empty, please fill");
    }
  }
}

class SaveButtonText extends StatelessWidget {
  const SaveButtonText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: updateButtonNotifier,
      builder: (BuildContext context, newValue, Widget? _) => Text(
        updateButtonNotifier.value != true ? "Save Data" : "Update Data",
      ),
    );
  }
}












///////////////////////////////////////////////////////////
///
///import 'package:flutter/material.dart';
// import 'package:student_details/Models/student_model.dart';
// import 'package:student_details/functions/crud.dart';
// import 'package:student_details/widgets/list_students.dart';

// final nameEditingController = TextEditingController();
// final ageEditingController = TextEditingController();
// final updateButtonNotifier = ValueNotifier(false);

// class AddStudent extends StatelessWidget {
//   const AddStudent({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.orange[600],
//       child: Column(
//         children: [
//           const Text(
//             "ADD STUDENT",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           ListTile(
//             title: const Text("       Student Name"),
//             subtitle: TextField(
//               controller: nameEditingController,
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25),
//                       topRight: Radius.circular(25)),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: Colors.purple,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ListTile(
//             title: const Text("       Student Age"),
//             subtitle: TextField(
//               controller: ageEditingController,
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(25),
//                       bottomRight: Radius.circular(25)),
//                   borderSide: BorderSide(
//                     width: 2,
//                     color: Colors.purple,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               //
//               saveOrUpdataeData();
//             },
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.blue[700])),
//             child: const SaveButtonText(),
//           ),
//         ],
//       ),
//     );
//   }

//   saveOrUpdataeData() {
//     int id = updateButtonNotifier.value != true
//         // ? idList.isNotEmpty
//         //     ? idList.last + 1
//         //     : 1
//         // : updateId;
//         ? studentListNotifier.value.isNotEmpty
//             ? studentListNotifier.value.last.id + 1
//             : 1
//         : updateId;
//         int hiveId = 
//         // updateButtonNotifier.value != true
//         // ? 
//         // studentListNotifier.value.isNotEmpty
//         //     ? studentListNotifier.value.last.hiveId! + 1
//         //     : 1
//         // : 
//         updateId;
//     String name = nameEditingController.text;
//     String age = ageEditingController.text;
//     if((name != null && name.isNotEmpty) && (age != null && age.isNotEmpty)){
//        Crud student = Crud(student: Student(id: id, name: name, age: age,hiveId: hiveId));
//     updateButtonNotifier.value == false
//         // ? student.addStudentData()
//         ? student.addStudentToBox()
//         // : student.updateData();
//         : student.updateStudentToBox(hiveId);
//     }else{
//       //
//       print("student name or age is empty, please fill");
//     }
   
//    }
// }

// class SaveButtonText extends StatelessWidget {
//   const SaveButtonText({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: updateButtonNotifier,
//       builder: (BuildContext context, newValue, Widget? _) => Text(
//         updateButtonNotifier.value != true ? "Save Data" : "Update Data",
//       ),
//     );
//   }
// }

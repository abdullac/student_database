import 'package:flutter/material.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/add_student.dart';

//bool updationData = false;
int updateId = -1;
var updateHiveId = -2;

class ListStudents extends StatelessWidget {
  const ListStudents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Student> studentList = studentListNotifier.value;
    return ValueListenableBuilder(
      //valueListenable: listNotifier,
      valueListenable: studentListNotifier,
      builder: (BuildContext context, value, Widget? child) => Container(
        color: Colors.deepOrange[400],
        child: ListView.separated(
          itemBuilder: (BuildContext ctx, int index) {
            Student studentData = studentList[index];
            // Crud student = Crud(
            //   id: studentData.id,
            //   name: studentData.name,
            //   age: studentData.age,
            // );
            // Map studentData = student.desplayListStudent(index);
            // student.getAllStudentsFromBox();
            return Container(
              height: 50,
              color: Colors.indigo,
              child: ListTile(
                leading: Text("${index + 1}"),
                // title: Text(studentData["name"]),
                // subtitle: Text("id: ${studentData["id"]}"),
                title: Text(studentData.name),
                subtitle: Text("${studentData.id}"),
                trailing: SizedBox(
                  width: 110,
                  child: Row(
                    children: [
                      Text(
                        // studentData["age"],
                        studentData.age,
                      ),
                      IconButton(
                        onPressed: () {
                          // delete button action
                          //// student.deleteStudentData(idList[index]);
                          if (dataBaseType == DataBaseType.variable) {
                            delete(index);
                          } else if (dataBaseType == DataBaseType.hive) {
                            int? hiveId = studentData.hiveId;
                            if (hiveId != null) {
                              delete(hiveId);
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            // update button action
                            updateButtonNotifier.value = true;
                            passToAddStudentArea(index);
                            print("index $index");
                          },
                          icon: const Icon(Icons.arrow_circle_up))
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext ctx, int index) => const SizedBox(
            height: 5,
          ),
          itemCount: studentList.length,
        ),
      ),
    );
  }

  passToAddStudentArea(index) {
    print("wewewewe1");
    updateId = studentListNotifier.value[index].id;
    print("wewewewe2");
    print("updataId $updateId");
    nameEditingController.text = studentListNotifier.value[index].name;
    print("wewewewe3");
    ageEditingController.text = studentListNotifier.value[index].age;
    print("wewewewe4");
    if (dataBaseType == DataBaseType.hive) {
    print("wewewewe5");
      updateHiveId = studentListNotifier.value[index].hiveId!;
    print("wewewewe6");
    }
  }
}













//////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:student_details/Models/student_model.dart';
// import 'package:student_details/crud.dart';
// import 'package:student_details/functions/crud.dart';
// import 'package:student_details/widgets/add_student.dart';

// //bool updationData = false;
// int updateId = -1;

// class ListStudents extends StatelessWidget {
//   const ListStudents({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     List<Student> studentList = studentListNotifier.value;
//     return ValueListenableBuilder(
//       //valueListenable: listNotifier,
//       valueListenable: studentListNotifier,
//       builder: (BuildContext context, value, Widget? child) => Container(
//         color: Colors.deepOrange[400],
//         child: ListView.separated(
//           itemBuilder: (BuildContext ctx, int index) {
//             Student studentData = studentList[index];
//             // Crud student = Crud(
//             //   id: studentData.id,
//             //   name: studentData.name,
//             //   age: studentData.age,
//             // );
//             // Map studentData = student.desplayListStudent(index);
//             // student.getAllStudentsFromBox();
//             return Container(
//               height: 50,
//               color: Colors.indigo,
//               child: ListTile(
//                 leading: Text("${index + 1}"),
//                 // title: Text(studentData["name"]),
//                 // subtitle: Text("id: ${studentData["id"]}"),
//                 title: Text(studentData.name),
//                 subtitle: Text("${studentData.id}"),
//                 trailing: SizedBox(
//                   width: 110,
//                   child: Row(
//                     children: [
//                       Text(
//                         // studentData["age"],
//                         studentData.age,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // delete button action
//                           //// student.deleteStudentData(idList[index]);
//                           Crud student = Crud(
//                               student: Student(
//                                   id: studentData.id,
//                                   name: studentData.name,
//                                   age: studentData.age,
//                                   hiveId: studentData.hiveId));
//                           if (studentData.hiveId != null) {
//                             student.deleteStudentFromBox(studentData.hiveId!);
//                             print("hiveew iddw ${studentData.hiveId}");
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.delete,
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             // update button action
//                             updateButtonNotifier.value = true;
//                             passToAddStudentArea(index);
//                           },
//                           icon: const Icon(Icons.arrow_circle_up))
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           separatorBuilder: (BuildContext ctx, int index) => const SizedBox(
//             height: 5,
//           ),
//           itemCount: studentList.length,
//         ),
//       ),
//     );
//   }

//   // desplayToAddStudent(index) {
//   //   updateId = idList[index];
//   //   nameEditingController.text = nameList[index];
//   //   ageEditingController.text = ageList[index];
//   // }
//   passToAddStudentArea(index) {
//     updateId = studentListNotifier.value[index].hiveId!;
//     nameEditingController.text = studentListNotifier.value[index].name;
//     ageEditingController.text = studentListNotifier.value[index].age;
//   }
// }

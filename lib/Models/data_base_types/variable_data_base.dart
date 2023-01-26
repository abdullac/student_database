import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/add_student.dart';

class VariableDataBase {
  //Student? student;
  VariableDataBase(
    //{this.student}
    ) {
    // if (student != null) {
    //   student = student!;
    // } else {
    //   print("this database is null");
    // }
  }

  addStudentToList(Student student) {
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  getAllStudentsFromList() {
    studentListNotifier.notifyListeners();
  }

  updateStudentToList(int index, Student student) {
    studentListNotifier.value[index] = student;
    getAllStudentsFromList();
  }

  deleteStudentFromList(int index) {
    studentListNotifier.value.removeAt(index);
    getAllStudentsFromList();
  }
}







////////////////////////////////////////////////
// import 'package:student_details/Models/student_model.dart';

// List<int> idList = [];

// List<String> nameList = [];

// List<String> ageList = [];




// class VariableDataBase {
//   Student? student;
//   VariableDataBase({this.student, 
//   }){
//     if(student !=null){
//       student = student!;
//     }else{
//       print("this database is null");
//     }
//   }


//    addStudentData() {
//     idList.add(student!.id);
//     nameList.add(name);
//     ageList.add(age);
//     listNotifier.value = nameList.length;
//     nameEditingController.text = "";
//     ageEditingController.text = "";
//   }

//   Map<String, dynamic> desplayListStudent(index) {
//     Map<String, dynamic> studentMap;
//     return studentMap = {
//       "roll": index + 1,
//       "id": idList[index],
//       "name": nameList[index],
//       "age": ageList[index],
//     };
//   }

//   deleteStudentData(int id) {
//     int position = idList.indexOf(id);
//     position != -1 ? removeData(position) : print("cannot delete, not find");
//     listNotifier.value = nameList.length;
//   }

//   removeData(position) {
//     idList.removeAt(position);
//     nameList.removeAt(position);
//     ageList.removeAt(position);
//   }

//   updateData() {
//     int position = idList.indexOf(id);
//     nameList[position] = name;
//     ageList[position] = age;
//     updateButtonNotifier.value = false;
//     listNotifier.value = nameList.length - 1;
//     listNotifier.value = nameList.length;
//   }
// }
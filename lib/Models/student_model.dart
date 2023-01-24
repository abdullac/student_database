import 'package:student_details/colletions/student_list.dart';
import 'package:student_details/widgets/add_student.dart';
import 'package:student_details/widgets/list_students.dart';

class Student {
  final int id;
  final String name;
  final String age;
  Student({
    required this.id,
    required this.name,
    required this.age,
  });

  addStudentData() {
    idList.add(id);
    nameList.add(name);
    ageList.add(age);
    listNotifier.value = nameList.length;
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  Map<String, dynamic> desplayListStudent(index) {
    Map<String, dynamic> studentMap;
    return studentMap = {
      "roll": index + 1,
      "id": idList[index],
      "name": nameList[index],
      "age": ageList[index],
    };
  }

  deleteStudentData(int id) {
    int position = idList.indexOf(id);
    position != -1 ? removeData(position) : print("cannot delete, not find");
    listNotifier.value = nameList.length;
  }

  removeData(position) {
    idList.removeAt(position);
    nameList.removeAt(position);
    ageList.removeAt(position);
  }

  updateData() {
    int position = idList.indexOf(id);
    nameList[position] = name;
    ageList[position] = age;
    updateButtonNotifier.value = false;
    listNotifier.value = nameList.length - 1;
    listNotifier.value = nameList.length;
  }
}

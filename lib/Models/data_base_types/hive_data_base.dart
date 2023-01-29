import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/add_student.dart';
import 'package:student_details/widgets/list_students.dart';

String boxName = 'studentDB';

class HiveDataBase {
  //Student? student;
  HiveDataBase(
      //{this.student}
      ) {
    // if (student != null) {
    //   student = student!;
    // }
  }

  static Future<void> initializeHiveAndAdapter() async {
    // initialize Hive
    await Hive.initFlutter();
    // register hive adapter (bridge)
    if (!Hive.isAdapterRegistered(StudentAdapter().typeId)) {
      Hive.registerAdapter(StudentAdapter());
    }
  }

  addStudentToBox(Student student) async {
    final studentDB = await Hive.openBox<Student>(boxName);
    int hiveId = await studentDB.add(student);
    student.hiveId = hiveId;
    //updateId = student.hiveId!;
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  getAllStudentsFromBox() async {
    final studentDB = await Hive.openBox<Student>(boxName);
    studentListNotifier.value.clear();
    studentListNotifier.value.addAll(studentDB.values);
    studentListNotifier.notifyListeners();
    //studentDB.clear(); // Delete all data from Box.
  }

  updateStudentToBox(int hiveId, Student student) async {
    final studentDB = await Hive.openBox<Student>(boxName);
    studentListNotifier.value.clear();
    student.hiveId = updateHiveId;
    studentDB.put(hiveId, student);
    getAllStudentsFromBox();
    updateButtonNotifier.value = false;
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  deleteStudentFromBox(int hiveId) async {
    final studentDB = await Hive.openBox<Student>(boxName);
    studentDB.delete(hiveId);
    getAllStudentsFromBox();
  }
}

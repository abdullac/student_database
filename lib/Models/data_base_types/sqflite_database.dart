import 'package:sqflite/sqflite.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/add_student.dart';
import 'package:student_details/widgets/list_students.dart';

String databaseName = "studentdatabase.db";
late Database studentDataBase;

class SqfliteDataBase {
  SqfliteDataBase();

  static Future<void> initializeSqflite() async {
    studentDataBase = await openDatabase(
      databaseName,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE student (sqfliteid INTEGER PRIMARY KEY,id INTEGER, name TEXT, age TEXT)',
        );
      },
    );
  }

  addStudentToSqlite(Student student) async {
    int sqfliteId = await studentDataBase.rawInsert(
        'INSERT INTO student(id, name, age) VALUES(?, ?, ?)',
        [student.id, student.name, student.age]);
    student.sqfliteId = sqfliteId;
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
    //getAllStudentsFromSqlite();
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  getAllStudentsFromSqlite() async {
    List<Map<String, Object?>> studentDBList =
        await studentDataBase.rawQuery('SELECT * FROM student');
    //print(studentDBList);
    studentListNotifier.value.clear();
    studentDBList.forEach((map) {
      Student studentData = Student.fromMap(map);
      studentListNotifier.value.add(studentData);
    });
    studentListNotifier.notifyListeners();
    //await deleteDatabase(databaseName); // Delete all data and sqflite database
  }

  updateStudentToSqlite(Student student) async {
    studentListNotifier.value.clear();
    student.sqfliteId = updateSqfliteId;
    await studentDataBase.rawUpdate(
        'UPDATE student SET id = ?, name = ?, age = ? WHERE sqfliteid = ?',
        [student.id, student.name, student.age, student.sqfliteId]);
    getAllStudentsFromSqlite();
    updateButtonNotifier.value = false;
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  deleteStudentFromSqlite(int sqfliteId) async {
    print("wwq");
    await studentDataBase.rawDelete('DELETE FROM student WHERE sqfliteid = ?', [sqfliteId]);
    getAllStudentsFromSqlite();
  }
}

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/add_student.dart';

enum StorageCrud {
  add,
  get,
  update,
  delete,
}

String dataBaseName = "studentdatabase";
String listOfstudentData = "studentsDataList";

class SharedPreferenceDataBase {
  SharedPreferenceDataBase();

  storageSharedPreference(
      {required String datBasName,
      required List<Map<String, dynamic>> stdntsMapList,
      required StorageCrud storageType}) async {
    final shpref = await SharedPreferences.getInstance();
    if (storageType == StorageCrud.add ||
        storageType == StorageCrud.delete ||
        storageType == StorageCrud.update) {
      String jsonOfMap = mapToJson(mapOfList(stdntsMapList));
      bool isSaved = await shpref.setString(datBasName, jsonOfMap);
      return isSaved;
    } else if (storageType == StorageCrud.get) {
      String? stringOfJson = shpref.getString(dataBaseName);
      if (stringOfJson != null) {
        List listOfStudenData = listOfChildMap(jsonToMap(stringOfJson));
        listOfStudenData.forEach((map) {
          stdntsMapList.add(map);
        });
      }
      return stdntsMapList;
    }
  }

  addStudentToShpref(Student student) async {
    studentsMapList.add(studentMap(student));
    bool isSaved = await storageSharedPreference(
        datBasName: dataBaseName,
        stdntsMapList: studentsMapList,
        storageType: StorageCrud.add);
    isSaved == true ? print("saved") : print("not saved");
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  getAllStudentsFromShpref() async {
    studentListNotifier.value.clear();
    studentsMapList.clear();
    studentsMapList = await storageSharedPreference(
        datBasName: dataBaseName,
        stdntsMapList: studentsMapList,
        storageType: StorageCrud.get);
    studentsMapList.forEach((map) {
      Student studentData = mapToModel(map);
      studentListNotifier.value.add(studentData);
      // shpref.clear();
    });
    studentListNotifier.notifyListeners();
  }

  updateStudentToShpref(Student student) async {
    studentListNotifier.value.clear();
    int index =
        studentsMapList.indexWhere((element) => element["id"] == student.id);
    studentsMapList[index]["id"] = student.id;
    studentsMapList[index]["name"] = student.name;
    studentsMapList[index]["age"] = student.age;
    bool isUpdate = await storageSharedPreference(
        datBasName: dataBaseName,
        stdntsMapList: studentsMapList,
        storageType: StorageCrud.update);
    isUpdate == true ? print("updated") : print("not updated");
    getAllStudentsFromShpref();
    updateButtonNotifier.value = false;
    nameEditingController.text = "";
    ageEditingController.text = "";
  }

  deleteStudentFromShpref(int id) async {
    studentsMapList.removeWhere((map) => map["id"] == id);
    bool isDeleted = await storageSharedPreference(
        datBasName: dataBaseName,
        stdntsMapList: studentsMapList,
        storageType: StorageCrud.delete);
    isDeleted == true ? print("deleted") : print("not deleted");
    getAll();
  }
}

//////////////////////////////////////// Add

// student model to map
Map<String, dynamic> studentMap(Student student) {
  return {
    "id": student.id,
    "name": student.name,
    "age": student.age,
  };
}

// all students map list
List<Map<String, dynamic>> studentsMapList = [];

// map covered on list ( map of list(list of child map))
Map<String, List<Map<String, dynamic>>> mapOfList(list) {
  Map<String, List<Map<String, dynamic>>> mapOfList = {
    listOfstudentData: list,
  };
  return mapOfList;
}

// convert map to json string
String mapToJson(map) {
  return json.encode(map);
}

/////////////////////////////////////// get all

// convert json string to map
Map<String, dynamic> jsonToMap(stringOfJson) {
  return json.decode(stringOfJson);
}

// open map of list (gets a list of students map)
List listOfChildMap(mapOfList) {
  return mapOfList[listOfstudentData];
}

// open list of map (map of student data)
Student mapToModel(Map<String, dynamic> map) {
  int id = map["id"];
  String name = map["name"];
  String age = map["age"];
  return Student(id: id, name: name, age: age);
}



///////////////////////////////////////////

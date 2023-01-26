import 'package:flutter/material.dart';
import 'package:student_details/Models/data_base_types/hive_data_base.dart';
import 'package:student_details/Models/data_base_types/variable_data_base.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/widgets/add_student.dart';

/***
 * 
 *  if you change databaseType,
 * you must change databasetype in 1 places
 * 1- this file line number 29.  ( DataBaseType dataBaseType = DataBaseType.variable; )
 * 
 * and you look/see must 3 places
 * 1- list_student file   passToAddStudentArea function.
 * 2&3- add_student file   saveOrUpdataeData function  2 places.
 * 
 *  ***/

ValueNotifier<List<Student>> studentListNotifier = ValueNotifier([]);

enum DataBaseType {
  variable,
  sharedPreference,
  hive,
  sqFlight,
}

//late DataBaseType dataBaseType;
DataBaseType dataBaseType = DataBaseType.sqFlight;

VariableDataBase variableDataBase = VariableDataBase();
//SharedPreferenceDataBase sharedPreferenceDataBase = SharedPreferenceDataBase();
HiveDataBase hiveDataBase = HiveDataBase();
//SqflightDataBase sqflightDataBase = SqflightDataBase();

add(Student student) {
  if (dataBaseType == DataBaseType.variable) {
    variableDataBase.addStudentToList(student);
  } else if (dataBaseType == DataBaseType.sharedPreference) {
    //
  }
  if (dataBaseType == DataBaseType.hive) {
    hiveDataBase.addStudentToBox(student);
  } else if (dataBaseType == DataBaseType.sqFlight) {
    //
  } else {
    //
  }
}

getAll() {
  if (dataBaseType == DataBaseType.variable) {
    variableDataBase.getAllStudentsFromList();
  } else if (dataBaseType == DataBaseType.sharedPreference) {
    //
  }
  if (dataBaseType == DataBaseType.hive) {
    hiveDataBase.getAllStudentsFromBox();
  } else if (dataBaseType == DataBaseType.sqFlight) {
    //
  } else {
    //
  }
}

update({required int primaryIndex, required Student student}) {
  if (dataBaseType == DataBaseType.variable) {
    variableDataBase.updateStudentToList(primaryIndex, student);
  } else if (dataBaseType == DataBaseType.sharedPreference) {
    //
  }
  if (dataBaseType == DataBaseType.hive) {
    hiveDataBase.updateStudentToBox(primaryIndex, student);
  } else if (dataBaseType == DataBaseType.sqFlight) {
    //
  } else {
    //
  }
  updateButtonNotifier.value = false;
}

delete(primaryIndex) {
  if (dataBaseType == DataBaseType.variable) {
    variableDataBase.deleteStudentFromList(primaryIndex);
  } else if (dataBaseType == DataBaseType.sharedPreference) {
    //
  }
  if (dataBaseType == DataBaseType.hive) {
    hiveDataBase.deleteStudentFromBox(primaryIndex);
  } else if (dataBaseType == DataBaseType.sqFlight) {
    //
  } else {
    //
  }
}

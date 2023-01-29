import 'package:flutter/material.dart';
import 'package:student_details/Models/data_base_types/hive_data_base.dart';
import 'package:student_details/Models/data_base_types/sqflite_database.dart';
import 'package:student_details/functions/crud.dart';
import 'package:student_details/widgets/main_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize DataBase
  if (dataBaseType == DataBaseType.hive) {
    await HiveDataBase.initializeHiveAndAdapter();
  } else if (dataBaseType == DataBaseType.sqFlight) {
    await SqfliteDataBase.initializeSqflite();
  } else if (dataBaseType == DataBaseType.sharedPreference) {
    //
  } else if (dataBaseType == DataBaseType.variable) {
    //
  } else {
    print("you have not set database type");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      title: "Student Details",
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("STUDENT  DETAILS"),
          ),
          body: const MainPage(),
        ),
      ),
    );
  }
}

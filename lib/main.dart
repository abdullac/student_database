import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/widgets/main_page.dart';


main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // initialize Hive
  await Hive.initFlutter();

  // register hive adapter (bridge)
  if(!Hive.isAdapterRegistered(StudentAdapter().typeId)){
    Hive.registerAdapter(StudentAdapter());
  }

    runApp(MyApp());
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

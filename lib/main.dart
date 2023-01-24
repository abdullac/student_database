import 'package:flutter/material.dart';
import 'package:student_details/widgets/main_page.dart';

main() {
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

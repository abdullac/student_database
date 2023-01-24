import 'package:flutter/material.dart';
import 'package:student_details/widgets/add_student.dart';
import 'package:student_details/widgets/list_students.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.pink[300],
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: const [
            Expanded(
              flex: 2,
              child: AddStudent(),
            ),
            Expanded(
              flex: 4,
              child: ListStudents(),
            ),
          ],
        ),
      ),
    );
  }
}

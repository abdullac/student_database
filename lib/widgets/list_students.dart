import 'package:flutter/material.dart';
import 'package:student_details/Models/student_model.dart';
import 'package:student_details/colletions/student_list.dart';
import 'package:student_details/widgets/add_student.dart';

final listNotifier = ValueNotifier(nameList.length);
//bool updationData = false;
int updateId = -1;

class ListStudents extends StatelessWidget {
  const ListStudents({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listNotifier,
      builder: (BuildContext context, value, Widget? child) => Container(
        color: Colors.deepOrange[400],
        child: ListView.separated(
            itemBuilder: (BuildContext ctx, int index) {
              Student student = Student(
                id: idList[index],
                name: nameList[index],
                age: ageList[index],
              );
              Map studentData = student.desplayListStudent(index);
              return Container(
                height: 50,
                color: Colors.indigo,
                child: ListTile(
                  leading: Text("SI.No\n${studentData["roll"]}"),
                  title: Text(studentData["name"]),
                  subtitle: Text("id: ${studentData["id"]}"),
                  trailing: SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        Text(
                          studentData["age"],
                        ),
                        IconButton(
                          onPressed: () {
                            // delete button action
                            student.deleteStudentData(idList[index]);
                          },
                          icon: const Icon(Icons.delete,),
                        ),
                        IconButton(onPressed: (){
                          // update button action
                          updateButtonNotifier.value = true;
                          desplayToAddStudent(index);
                        }, icon: const Icon(Icons.arrow_circle_up))
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext ctx, int index) => const SizedBox(
                  height: 5,
                ),
            itemCount: nameList.length),
      ),
    );
  }

  desplayToAddStudent(index){
    updateId = idList[index];
    nameEditingController.text = nameList[index];
    ageEditingController.text = ageList[index];
  }

}

import 'package:flutter/material.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/student_edit_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage(this.student, {Key? key}) : super(key: key);

  final Student student;

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late final ValueNotifier<Student> studentNotifier;

  @override
  void initState() {
    super.initState();
    studentNotifier = ValueNotifier(widget.student);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentNotifier,
      builder: (context, student, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(student.name),
            actions: [
              IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StudentEditPage(studentNotifier),
                  ));
                },
                icon: Icon(Icons.edit),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('NAME:'),
                    Spacer(),
                    Text(student.name),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('AGE:'),
                    Spacer(),
                    Text(student.age.toString()),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text('GRADE:'),
                    Spacer(),
                    Text(student.grade.toString()),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Go back'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

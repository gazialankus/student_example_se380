import 'package:flutter/material.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/student_edit_page.dart';

class StudentPage extends StatefulWidget {
  const StudentPage(this.student, this.studentService, this.reFetchStudents, {Key? key}) : super(key: key);

  final Student student;
  final StudentService studentService;
  final VoidCallback reFetchStudents;

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student.name),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentEditPage(widget.student, widget.studentService, widget.reFetchStudents),
              ));
              setState(() {
              });
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
                Text(widget.student.name),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('AGE:'),
                Spacer(),
                Text(widget.student.age.toString()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('GRADE:'),
                Spacer(),
                Text(widget.student.grade.toString()),
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
}

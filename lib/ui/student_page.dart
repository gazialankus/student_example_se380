import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/student_edit_page.dart';

class StudentPage extends ConsumerWidget {
  const StudentPage(this.studentId, {Key? key}) : super(key: key);

  final String studentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final student = ref.watch(studentProvider(studentId));

    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentEditPage(studentId),
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
}

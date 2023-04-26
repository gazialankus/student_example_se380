import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/student_page.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentService = ref.watch(studentServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Students'),),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: studentService.studentsNotifier,
          builder: (context, students, _) {
            return Column(
              children: [
                ColoredBox(
                  color: Colors.lightBlue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('My Students:'),
                  ),
                ),
                Column(
                  children: students.map((student) => StudentInList(student)).toList(),
                ),
                SizedBox(height: 40),
                _MaxStudent(students),
                _MinStudent(students),
              ],
            );
          },
        ),
      ),
    );
  }
}

class StudentInList extends StatelessWidget {
  const StudentInList(this.student, {super.key});

  final Student student;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return StudentPage(student);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              student.name,
            ),
            Text(
              '${student.age}',
            ),
            Text(
              '${student.grade}',
            ),
          ],
        ),
      ),
    );
  }
}

class _MaxStudent extends StatefulWidget {
  const _MaxStudent(this.students, {super.key});

  final List<Student> students;

  @override
  State<_MaxStudent> createState() => _MaxStudentState();
}

class _MaxStudentState extends State<_MaxStudent> {
  late Student studentWithMaxGrade;
  late double maxGrade;
  @override
  void initState() {
    super.initState();
    studentWithMaxGrade = widget.students.reduce((s1, s2) => s1.grade > s2.grade ? s1 : s2);
    maxGrade = studentWithMaxGrade.grade;
  }

  @override
  void didUpdateWidget(covariant _MaxStudent oldWidget) {
    super.didUpdateWidget(oldWidget);
    studentWithMaxGrade = widget.students.reduce((s1, s2) => s1.grade > s2.grade ? s1 : s2);
    maxGrade = studentWithMaxGrade.grade;
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MAX: ${studentWithMaxGrade.name}',
            ),
            Text(
              '${studentWithMaxGrade.age}',
            ),
            Text(
              '${maxGrade}',
            ),
          ],
        ),
      ),
    );
  }
}

class _MinStudent extends StatefulWidget {
  const _MinStudent(this.students, {super.key});

  final List<Student> students;

  @override
  State<_MinStudent> createState() => _MinStudentState();
}

class _MinStudentState extends State<_MinStudent> {
  late Student studentWithMaxGrade;
  @override
  void initState() {
    super.initState();
    studentWithMaxGrade = widget.students.reduce((s1, s2) => s1.grade < s2.grade ? s1 : s2);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MIN: ${studentWithMaxGrade.name}',
            ),
            Text(
              '${studentWithMaxGrade.age}',
            ),
            Text(
              '${studentWithMaxGrade.grade}',
            ),
          ],
        ),
      ),
    );
  }
}

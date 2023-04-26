import 'package:flutter/material.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/student_page.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage(this.studentService, {super.key});

  final StudentService studentService;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late List<Student> students;
  @override
  void initState() {
    students = widget.studentService.fetchStudents();
    super.initState();
  }

  void reFetchStudents() {
    setState(() {
      students = widget.studentService.fetchStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students'),),
      body: SafeArea(
        child: Column(
          children: [
            ColoredBox(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('My Students:'),
              ),
            ),
            Column(
              children: students.map((student) => StudentInList(student, widget.studentService, reFetchStudents)).toList(),
            ),
            SizedBox(height: 40),
            _MaxStudent(students),
            _MinStudent(students),
          ],
        ),
      ),
    );
  }
}

class StudentInList extends StatefulWidget {
  const StudentInList(this.student, this.studentService, this.reFetchStudents, {super.key});

  final Student student;
  final StudentService studentService;
  final VoidCallback reFetchStudents;

  @override
  State<StudentInList> createState() => _StudentInListState();
}

class _StudentInListState extends State<StudentInList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StudentPage(widget.student, widget.studentService, widget.reFetchStudents),
        ));
        setState(() {
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.student.name,
            ),
            Text(
              '${widget.student.age}',
            ),
            Text(
              '${widget.student.grade}',
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

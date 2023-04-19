import 'package:flutter/material.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/students_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StudentService studentService;

  @override
  void initState() {
    super.initState();
    studentService = StudentService();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(studentService),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage(this.studentService, {Key? key}) : super(key: key);

  final StudentService studentService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // get students from service

              print('will go to students');
              // give students to StudentsPage
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => StudentsPage(studentService),
              ));
            },
            child: Text(
              'Students'
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';
import 'package:se380_student/ui/students_page.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

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
                builder: (context) => StudentsPage(),
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



import 'package:flutter/cupertino.dart';
import 'package:se380_student/model/student.dart';

class StudentService {
  final studentsNotifier = ValueNotifier<List<Student>>([
    Student(
      name: 'Ali',
      age: 19,
      grade: 100,
    ),
    Student(
      name: 'Veli',
      age: 20,
      grade: 10,
    ),
    Student(
      name: 'Ahmet',
      age: 18,
      grade: 90,
    ),
  ]);

  void replaceStudent(Student oldStudent, Student newStudent) {
    final students = studentsNotifier.value;

    final index = students.indexOf(oldStudent);
    final newStudents = [...students];
    newStudents[index] = newStudent;
    studentsNotifier.value = newStudents;
  }

}

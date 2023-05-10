import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:se380_student/model/student.dart';

final studentServiceProvider = ChangeNotifierProvider((ref) => StudentService());

final studentsProvider = Provider((ref) {
  final studentService = ref.watch(studentServiceProvider);
  return studentService.fetchStudents();
});

final studentProvider = Provider.family<Student, String>((ref, id) {
  final studentService = ref.watch(studentServiceProvider);
  return studentService.fetchStudent(id);
});

class StudentService extends ChangeNotifier {
  var students = [
    Student(
      id: '0',
      name: 'Ali',
      age: 19,
      grade: 100,
    ),
    Student(
      id: '1',
      name: 'Veli',
      age: 20,
      grade: 10,
    ),
    Student(
      id: '2',
      name: 'Ahmet',
      age: 18,
      grade: 90,
    ),
  ];

  void replaceStudent(Student oldStudent, Student newStudent) {
    // could use the id for easier change
    final index = students.indexOf(oldStudent);
    final newStudents = [...students];
    newStudents[index] = newStudent;
    students = newStudents;
    notifyListeners();
  }

  List<Student> fetchStudents() {
    return students;
  }

  Student fetchStudent(String id) {
    return students.firstWhere((s) => s.id == id);
  }

}

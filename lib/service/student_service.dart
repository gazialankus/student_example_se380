import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:se380_student/model/student.dart';
import 'package:http/http.dart' as http;

const apiBaseUrl = 'https://645b91fc99b618d5f31f0467.mockapi.io/api';

final studentServiceProvider = ChangeNotifierProvider((ref) => StudentService());

final studentsProvider = FutureProvider((ref) {
  final studentService = ref.watch(studentServiceProvider);
  return studentService.fetchStudents();
});

final studentProvider = FutureProvider.family<Student, String>((ref, id) {
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

  Future<void> replaceStudent(Student oldStudent, Student newStudent) async {
    await http.put(Uri.parse('$apiBaseUrl/Student/${oldStudent.id}'));
    notifyListeners();
  }

  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/Student'));
    final listOfMaps = jsonDecode(response.body);

    if (listOfMaps is List) {
      var list = listOfMaps.map((m) => Student.fromJson(m)).toList();
      return list;
    } else {
      return [];
    }
  }

  Future<Student> fetchStudent(String id) async {
    final response = await http.get(Uri.parse('$apiBaseUrl/Student/$id'));
    var body = response.body;
    print(body);
    return Student.fromJson(jsonDecode(body));
  }

}

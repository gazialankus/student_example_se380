

import 'package:se380_student/model/student.dart';

class StudentService {
  List<Student>? students;

  List<Student> fetchStudents() {
    if (students == null) {
      students = [
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
      ];
    }

    return students!;
  }

  void replaceStudent(Student oldStudent, Student newStudent) {
    final students = this.students;
    if (students == null) return;

    final index = students.indexOf(oldStudent);
    students[index] = newStudent;
  }

}

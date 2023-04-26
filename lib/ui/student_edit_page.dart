import 'package:flutter/material.dart';
import 'package:se380_student/model/student.dart';
import 'package:se380_student/service/student_service.dart';

class StudentEditPage extends StatefulWidget {
  StudentEditPage(this.student, this.studentService, this.reFetchStudents, {super.key});

  final Student student;
  final StudentService studentService;
  final VoidCallback reFetchStudents;

  @override
  State<StudentEditPage> createState() => _StudentEditPageState();
}

class _StudentEditPageState extends State<StudentEditPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController ageController;
  late final TextEditingController gradeController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    ageController = TextEditingController(text: widget.student.age.toString());
    gradeController = TextEditingController(text: widget.student.grade.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  void _save() {
    final formState = _formKey.currentState;
    if (formState != null) {
      if (formState.validate()) {
        print('yay form is valid');
        final name = nameController.text;
        final age = int.parse(ageController.text);
        final grade = double.parse(gradeController.text);

        final oldStudent = widget.student;
        final newStudent = Student(
            name: name,
            age: age,
            grade: grade,
          );


        print('old student: ');
        print('${oldStudent.name} ${oldStudent.age} ${oldStudent.grade}');
        print('new student: ');
        print('${newStudent.name} ${newStudent.age} ${newStudent.grade}');

        if (oldStudent != newStudent) {
          print('different because of reference, but could have same values');
          widget.studentService.replaceStudent(
            widget.student,
            newStudent,
          );
          widget.reFetchStudents();
        }



        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not save, please try again.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDITING ${widget.student.name}'),
        actions: [
          IconButton(
            onPressed: _save,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Name'),
                ),
              ),
              TextFormField(
                controller: ageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'You have to provide an age';
                  }
                  var maybeAge = int.tryParse(value);
                  if (maybeAge == null || maybeAge <= 0) {
                    return 'Please provide a valid integer as age';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Age'),
                ),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: gradeController,
                decoration: InputDecoration(
                  label: Text('Grade'),
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nameController.text = widget.student.name;
                        ageController.text = widget.student.age.toString();
                        gradeController.text = widget.student.grade.toString();
                      });
                    },
                    child: Text('UNDO'),
                  ),
                  ElevatedButton(
                    onPressed: _save,
                    child: Text('SAVE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

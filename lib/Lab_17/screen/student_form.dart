import 'package:flutter/material.dart';
import '../model/student.dart';
import '../db/db_helper.dart';

class StudentFormScreen extends StatefulWidget {
  final Student? student;

  const StudentFormScreen({super.key, this.student});

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController courseController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student?.name ?? '');
    ageController = TextEditingController(text: widget.student?.age?.toString() ?? '');
    courseController = TextEditingController(text: widget.student?.course ?? '');
  }

  void saveStudent() async {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        id: widget.student?.id,
        name: nameController.text,
        age: int.parse(ageController.text),
        course: courseController.text,
      );

      if (widget.student == null) {
        await DBHelper.insertStudent(student);
      } else {
        await DBHelper.updateStudent(student);
      }

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  prefixIcon: const Icon(Icons.numbers),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter age' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: courseController,
                decoration: InputDecoration(
                  labelText: 'Course',
                  prefixIcon: const Icon(Icons.book),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (val) => val!.isEmpty ? 'Enter course' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: Icon(widget.student == null ? Icons.save : Icons.update),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: saveStudent,
                label: Text(widget.student == null ? 'Save Student' : 'Update Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

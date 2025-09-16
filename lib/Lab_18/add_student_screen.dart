import 'package:flutter/material.dart';
import '../Lab_18/model/student.dart';
import 'db_helper.dart';


class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _enroll = TextEditingController();
  final TextEditingController _sem = TextEditingController();
  final TextEditingController _branch = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  final DBHelper _dbHelper = DBHelper();

  void _saveStudent() async {
    if (_name.text.isEmpty ||
        _enroll.text.isEmpty ||
        _sem.text.isEmpty ||
        _branch.text.isEmpty ||
        _mobile.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    Student student = Student(
      name: _name.text,
      enrollment: _enroll.text,
      semester: _sem.text,
      branch: _branch.text,
      mobile: _mobile.text,
    );

    await _dbHelper.insertStudent(student);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Student Added')),
    );

    _name.clear();
    _enroll.clear();
    _sem.clear();
    _branch.clear();
    _mobile.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _name, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: _enroll, decoration: const InputDecoration(labelText: 'Enrollment')),
            TextField(controller: _sem, decoration: const InputDecoration(labelText: 'Semester')),
            TextField(controller: _branch, decoration: const InputDecoration(labelText: 'Branch')),
            TextField(controller: _mobile, decoration: const InputDecoration(labelText: 'Mobile')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveStudent,
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

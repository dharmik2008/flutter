import 'package:flutter/material.dart';
import '../Lab_18/add_student_screen.dart';
import '../Lab_18/model/student.dart';
import '../Lab_18/db_helper.dart';
import 'package:untitled/Lab_20/edit_student_screen.dart';
import 'student_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DBHelper _dbHelper = DBHelper();
  List<Student> _students = [];

  @override
  void initState() {
    super.initState();
    _refreshStudents();
  }

  Future<void> _refreshStudents() async {
    final students = await _dbHelper.getStudents();
    setState(() {
      _students = students;
    });
  }

  Future<void> _deleteStudent(int id) async {
    await _dbHelper.deleteStudent(id);
    _refreshStudents();
  }

  void _editStudent(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditStudentScreen(student: student)),
    ).then((_) => _refreshStudents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: _students.isEmpty
          ? const Center(child: Text('No students found.'))
          : ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final s = _students[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(
                s.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Enroll: ${s.enrollment}\n"
                    "Sem: ${s.semester}, Branch: ${s.branch}\n"
                    "Mobile: ${s.mobile}",
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => StudentDetailScreen(student: s),
                  ),
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _editStudent(s),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteStudent(s.id!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddStudentScreen()),
          ).then((_) => _refreshStudents());
        },
      ),
    );
  }
}

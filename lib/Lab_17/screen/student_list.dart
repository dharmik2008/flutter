import 'package:flutter/material.dart';
import '../db/db_helper.dart';
import '../model/student.dart';
import 'student_form.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final data = await DBHelper.getStudents();
    setState(() {
      students = data;
    });
  }

  Future<void> deleteStudent(int id) async {
    await DBHelper.deleteStudent(id);
    fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const StudentFormScreen()),
          );
          fetchStudents();
        },
        backgroundColor: Colors.green,
        tooltip: "Add Student",
        child: const Icon(Icons.add),
      ),
      body: students.isEmpty
          ? const Center(
        child: Text(
          'No students added yet!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      )
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(
                  student.name.isNotEmpty
                      ? student.name[0].toUpperCase()
                      : '?',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              title: Text(
                student.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${student.course} • Age: ${student.age}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: "Edit",
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              StudentFormScreen(student: student),
                        ),
                      );
                      fetchStudents();
                    },
                  ),
                  IconButton(
                    tooltip: "Delete",
                    icon:
                    const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: () => deleteStudent(student.id!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

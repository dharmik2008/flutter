import 'package:flutter/material.dart';
import '../Lab_18/model/student.dart';

class StudentDetailScreen extends StatelessWidget {

  final Student student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${student.name}", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Enrollment: ${student.enrollment}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Semester: ${student.semester}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Branch: ${student.branch}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text("Mobile: ${student.mobile}", style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

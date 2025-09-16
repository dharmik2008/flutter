import 'package:flutter/material.dart';
// import '../../Lab_17/model/student.dart';
import '../Lab_18/db_helper.dart';
import '../Lab_18/model/student.dart';

class EditStudentScreen extends StatefulWidget {
  final Student student;
  const EditStudentScreen({super.key, required this.student});

  @override
  State<EditStudentScreen> createState() => _EditStudentScreenState();
}

class _EditStudentScreenState extends State<EditStudentScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _enroll = TextEditingController();
  final TextEditingController _sem = TextEditingController();
  final TextEditingController _branch = TextEditingController();
  final TextEditingController _mobile = TextEditingController();

  final DBHelper _dbHelper = DBHelper();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // prefill values
    _name.text = widget.student.name;
    _enroll.text = widget.student.enrollment;
    _sem.text = widget.student.semester;
    _branch.text = widget.student.branch;
    _mobile.text = widget.student.mobile;

    // animations
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateStudent() async {
    if (_name.text.isEmpty ||
        _enroll.text.isEmpty ||
        _sem.text.isEmpty ||
        _branch.text.isEmpty ||
        _mobile.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠ Please fill all fields')),
      );
      return;
    }

    Student updated = Student(
      id: widget.student.id, // keep same ID
      name: _name.text,
      enrollment: _enroll.text,
      semester: _sem.text,
      branch: _branch.text,
      mobile: _mobile.text,
    );

    await _dbHelper.updateStudent(updated);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✅ Student Updated Successfully')),
    );

    if (mounted) Navigator.pop(context, true); // return to Home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Student"),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 6,
              shadowColor: Colors.deepPurple.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    buildTextField(_name, "Name", Icons.person),
                    const SizedBox(height: 12),
                    buildTextField(_enroll, "Enrollment", Icons.badge),
                    const SizedBox(height: 12),
                    buildTextField(_sem, "Semester", Icons.school),
                    const SizedBox(height: 12),
                    buildTextField(_branch, "Branch", Icons.account_tree),
                    const SizedBox(height: 12),
                    buildTextField(_mobile, "Mobile", Icons.phone),
                    const SizedBox(height: 24),

                    // Update Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: _updateStudent,
                        icon: const Icon(Icons.update),
                        label: const Text(
                          "Update Student",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Custom textfield builder
  Widget buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        labelText: label,
        filled: true,
        fillColor: Colors.deepPurple.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    );
  }
}

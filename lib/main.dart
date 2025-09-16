import 'package:flutter/material.dart';
import 'package:untitled/Lab_19/home_screen.dart';

import 'Lab_20/edit_student_screen.dart';
import 'Lab_21/P1.dart';
import 'Lab_22/p1.dart';
import 'Lab_22/p2.dart';
import 'Lab_23/p1.dart';
import 'Lab_24/P1.dart';
import 'Lab_26/p1.dart';
import 'Lab_27/p1.dart';
import 'Lab_28/p1.dart';
import 'Lab_29/p1.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsPaginationScreen(),
    );
  }
}

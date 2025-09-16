import 'package:flutter/material.dart';

class nineparts extends StatelessWidget {
  const nineparts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('lab_4 P4',
              style: (TextStyle(fontSize: 40, color: Colors.red))),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.blueGrey)),
                  Expanded(child: Container(color: Colors.grey))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.lightGreenAccent)),
                  Expanded(child: Container(color: Colors.lightGreen))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.purple)),
                  Expanded(child: Container(color: Colors.pink)),
                  Expanded(child: Container(color: Colors.brown))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

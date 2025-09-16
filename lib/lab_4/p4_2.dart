import 'package:flutter/material.dart';

class ninepartsb extends StatelessWidget {
  const ninepartsb({super.key});

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
                  Expanded(flex: 1, child: Container(color: Colors.blue)),
                  Expanded(flex: 2,child: Container(color: Colors.blueGrey)),
                  Expanded(flex: 3,child: Container(color: Colors.grey))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 4,child: Container(color: Colors.red)),
                  Expanded(flex: 5,child: Container(color: Colors.lightGreenAccent)),
                  Expanded(flex: 6,child: Container(color: Colors.lightGreen))
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(flex: 7,child: Container(color: Colors.purple)),
                  Expanded(flex: 8,child: Container(color: Colors.pink)),
                  Expanded(flex: 9,child: Container(color: Colors.brown))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void main()
{
  runApp(ninepartsb());
}
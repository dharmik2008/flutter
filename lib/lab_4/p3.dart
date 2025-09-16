import 'package:flutter/material.dart';

class VarticalParts extends StatelessWidget {
  const VarticalParts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('lab_4 P3',
              style: (TextStyle(fontSize: 40,color: Colors.red))),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,

        ),
        body: Row(
          children: [
            Expanded(child: Container(color: Colors.blue)),
            Expanded(child: Container(color: Colors.lightBlue)),
            Expanded(child: Container(color: Colors.cyan))
          ],
        ),
      ),
    );
  }
}

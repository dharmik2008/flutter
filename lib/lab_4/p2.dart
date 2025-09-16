import 'package:flutter/material.dart';

class HorizontalParts extends StatelessWidget {
  const HorizontalParts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('lab_4 P2',
          style: (TextStyle(fontSize: 40,color: Colors.red))),
              backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,

        ),
        body: Column(
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

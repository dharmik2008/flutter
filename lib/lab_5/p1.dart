import 'package:flutter/material.dart';
class TextWidgetDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
        title: Text('LAB_5 P1'),
        centerTitle: true,
        backgroundColor: Colors.purple,
    ),
          body: Center(
            child: Text("Hello World",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold,backgroundColor: Colors.lightBlueAccent)),
          ),
        ),
    );
  }
}

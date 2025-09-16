import 'package:flutter/material.dart';
class TextFieldAndController extends StatelessWidget {
final nameController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('LAB_5 p2'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name",labelText: "enter Name",border: OutlineInputBorder(),
          ),
        ),
    ),
    ElevatedButton(onPressed: () {
      print(nameController.text);
    }, child: Text("Submit"),),
        ],
      ),
    ),
    );
  }
}

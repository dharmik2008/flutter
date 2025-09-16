import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Demo"),
        ),
        body: Center(
          child: Image.asset("assets/image/lion.jpg"),
        ),
      ),
    );
  }
}

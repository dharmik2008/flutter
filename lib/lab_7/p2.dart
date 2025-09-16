import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Darshan University"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset("assets/image/du.png"),
            Text(
              "Darshan University",
              style: TextStyle(
                fontSize: 25,
                color: Colors.cyanAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

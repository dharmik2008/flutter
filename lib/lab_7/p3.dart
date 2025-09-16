import 'package:flutter/material.dart';

class p3 extends StatelessWidget {
  const p3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy BirthDay 💖🎈"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset("assets/image/happy-birthday.png"),
            Text(
              "Happy BirthDay💖🎈",
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

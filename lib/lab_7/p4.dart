import 'package:flutter/material.dart';

class p4 extends StatelessWidget {
  const p4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMW 😎😍🥰❤️"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.bottomCenter,
          children: [
            Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9_fjas19uVcPsWzOxEbOKDmoTxefqxTsBaA&sp'),
          ],
        ),
      ),
    );
  }
}

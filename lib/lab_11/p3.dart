import 'package:flutter/material.dart';

void main() => runApp(GrideView());

class GrideView extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/image/Frame 1.png',
    'assets/image/Frame 2.png',
    'assets/image/Frame 3.png',
    'assets/image/Frame 4.png',
    'assets/image/Frame 5.png',
    'assets/image/Frame 6.png',
    'assets/image/Frame 7.png',
    'assets/image/Frame 8.png',
    'assets/image/Frame 9.png',
    'assets/image/Frame 10.png',

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGridScreen(imagePaths: imagePaths),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  final List<String> imagePaths;

  const ImageGridScreen({Key? key, required this.imagePaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("GridView Example"),
          bottom: TabBar(tabs: [
            Tab(text: "GridView"),
            Tab(text: "GridView.builder"),
          ]),
        ),
        body: TabBarView(
          children: [
            // GridView (static)
            GridView.count(
              crossAxisCount: 2,
              children: imagePaths.map((path) {
                return Card(
                  child: Image.asset(path, fit: BoxFit.cover),
                );
              }).toList(),
            ),

            // GridView.builder (dynamic)
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
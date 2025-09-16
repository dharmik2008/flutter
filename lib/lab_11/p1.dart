import 'package:flutter/material.dart';

class ListViewDemo1 extends StatefulWidget {
  const ListViewDemo1({super.key});

  @override
  State<ListViewDemo1> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewDemo1> {
  List<int> numbers = [123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,
    365,101,123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,365,101];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("List View Demo 1",style: TextStyle(color: Colors.white),),
      ),
      body: ListView(
        children: numbers.map((number) {
          return ListTile(
            title: Text(number.toString()),
          );
        }).toList(),
      ),
    );
  }
}

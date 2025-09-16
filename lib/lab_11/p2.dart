import 'package:flutter/material.dart';

class ListViewDemo2 extends StatefulWidget {
  const ListViewDemo2({super.key});

  @override
  State<ListViewDemo2> createState() => _ListViewDemo2State();
}

class _ListViewDemo2State extends State<ListViewDemo2> {
  List<int> numbers =[123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,
    365,101,123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,365,101,
    123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,
    365,101,123,456,789,852,741,963,753,951,489,984,654,123,584,694,749,521,125,652,256,362,236,154,152,635,536,635,365,101];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text("List View Demo 2"),
      ),
      body: ListView.builder(
          itemCount: numbers.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Icon(Icons.numbers),
              title: Text(numbers[index].toString()),
            );
          })
    );
  }
}

import 'package:flutter/material.dart';
class qvoteapp extends StatefulWidget {
  const qvoteapp({super.key});

  @override
  State<qvoteapp> createState() => _qvoteappState();
}

class _qvoteappState extends State<qvoteapp> {
  Widget qvotecard({required String text,required String author}){
    return Card(

      child: ListTile(
        title: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        subtitle: Text(author,style: TextStyle(fontSize: 18,color: Colors.grey),),
        trailing: IconButton(onPressed: (){
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("copied to clipboard")));
        },
            icon: Icon(Icons.copy,color: Colors.red,)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Quats"),
          backgroundColor: Colors.grey,
        ),
        body: Column(
            children: [
              qvotecard(text: "A rose by any other name would smell as sweet.",author: "Author: William Shakespeare"),
              qvotecard(text: "Elementary, my dear Watson.",author: "Author: Sherlock Holmes"),
              qvotecard(text: "Go ahead, make my day.",author: "Author: Harry Callahan"),
            ]
        ),
      ),
    );
  }
}
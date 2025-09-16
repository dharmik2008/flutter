import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController expressionController = TextEditingController(text: '0');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: TextField(
              readOnly: true,
              controller: expressionController,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 80),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(
                      text: 'AC',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(text: '7',
                        bgColor: Colors.black45),
                    button(text: '4',
                        bgColor: Colors.black45),
                    button(text: '1',
                        bgColor: Colors.black45),
                    button(text: '00',
                        bgColor: Colors.black45),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(
                      text: '( )',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(text: '8',
                        bgColor: Colors.black45),
                    button(text: '5',
                        bgColor: Colors.black45),
                    button(text: '2',
                        bgColor: Colors.black45),
                    button(text: '0',
                        bgColor: Colors.black45),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(
                      text: '%',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(text: '9',
                      bgColor: Colors.black45,),
                    button(text: '6',
                        bgColor: Colors.black45),
                    button(text: '3',
                        bgColor: Colors.black45),
                    button(text: '.',
                        bgColor: Colors.black45),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    button(
                      text: '/',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(
                      text: '*',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(
                      text: '-',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(
                      text: '+',
                      bgColor: Colors.grey.shade300,
                    ),
                    button(text: '=',
                        bgColor: Colors.grey.shade300),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

ElevatedButton button({required String text, Color bgColor = Colors.white}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(38),
          backgroundColor: bgColor),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 24, height: 1),
      ));
}

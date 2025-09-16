import 'package:flutter/material.dart';

void main() {
  runApp(QuoteSwiperApp());
}

class QuoteSwiperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteSwiper(),
    );
  }
}

class QuoteSwiper extends StatelessWidget {
  final List<String> quotes = [
    "“The best way to get started is to quit talking and begin doing.”",
    "“Don’t let yesterday take up too much of today.”",
    "“It’s not whether you get knocked down, it’s whether you get up.”",
    "“Success is not final, failure is not fatal: it is the courage to continue that counts.”",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes Swiper UI"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: PageView.builder(
        itemCount: quotes.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.deepPurple[50],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.format_quote,
                      color: Colors.deepPurple, size: 40),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      quotes[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  IconButton(
                    icon: const Icon(Icons.favorite_border,
                        color: Colors.red, size: 30),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Liked Quote #${index + 1}"),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

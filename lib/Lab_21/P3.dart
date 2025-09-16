import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class jsonData extends StatelessWidget {
  const jsonData({super.key});

  Future<List<Product>> _loadProducts() async {
    final String response = await rootBundle.loadString('assets/data/jsonclass.json');
    final List<dynamic> data = json.decode(response);
    return data.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch JSON Example',
      home: Scaffold(
        appBar: AppBar(title: const Text("Products List")),
        body: FutureBuilder<List<Product>>(
          future: _loadProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No data found"));
            } else {
              final products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final p = products[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(p.id.toString()),
                      ),
                      title: Text(p.title),
                      subtitle: Text("Category: ${p.category}"),
                      trailing: Text("₹${p.price}"),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String title;
  final int price;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
    );
  }
}
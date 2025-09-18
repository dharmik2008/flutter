import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API2 extends StatelessWidget {
  const API2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FoodListPage(),
    );
  }
}

class Food {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
  });
  factory Food.fromJson(Map<String, dynamic> a) => Food(
      id: a['id'],
      name: a['name'],
      description: a['description'],
      imageUrl: a['imageUrl'],
      price: double.tryParse(a['price'].toString()) ?? 0,
      category: a['category']);
}

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  late Future<List<Food>> _futureFoods;
  @override
  void initState() {
    _futureFoods = fetchFoods();
  }

  Future<List<Food>> fetchFoods() async {
    const String apiUrl = "https://68ca25d4430c4476c3485c09.mockapi.io/demo";
    final res = await http.get(Uri.parse(apiUrl));
    final List data = jsonDecode(res.body);
    return data.map((j) => Food.fromJson(j)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Menu")),
      body: FutureBuilder<List<Food>>(
        future: _futureFoods,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final foods = snapshot.data!;
          return ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final f = foods[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(f.imageUrl),
                  ),
                  title: Text(f.name),
                  subtitle: Text(f.description),
                  trailing: Text("${f.price}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'dart:convert';

class Product {
  final String id;
  final String title;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
    };
  }
}

void main() {
  String jsonString = '''
  {
    "id": "101",
    "title": "abc",
    "price": 599.99,
    "category": "hello"
  }
  ''';

  Map<String, dynamic> productMap = jsonDecode(jsonString);
  Product product = Product.fromJson(productMap);

  print("ID: ${product.id}");
  print("Title: ${product.title}");
  print("Price: ${product.price}");
  print("Category: ${product.category}");

  String encoded = jsonEncode(product.toJson());
  print("Back to JSON: $encoded");
}
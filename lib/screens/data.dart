import 'dart:convert';
import 'package:http/http.dart' as http;
export 'data.dart';

class Product {
  int? id;
  String? title;
  String? description;
  dynamic category;
  String? image;
  int? quantity;
  String? price;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.image,
    this.quantity,
    this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}

class Category {
  int? id;
  String? image;
  String? name;
  Category({
    this.id,
    this.image,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}

Future<List<Product>> getProducts(String categoryName) async {
  String url =
      'https://neobook.online/ecobak/product-list/?category_name=$categoryName';

  final response = await http.get(Uri.parse(url));

  try {
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));

      List<Product> products =
          responseData.map((json) => Product.fromJson(json)).toList();
      return products;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Error in getProducts: $error');
    throw Exception('Error: $error');
  }
}

Future<List<Category>> getCategories() async {
  String url = 'https://neobook.online/ecobak/product-category-list/';
  final response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));

      List<Category> categories =
          responseData.map((json) => Category.fromJson(json)).toList();
      return categories;
    } else {
      throw Exception(
          'Failed to fetch categories.Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}

/*External dependencies */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
/*Local dependencies */
import 'package:ecomarket/repository/models/category.dart';
import 'package:ecomarket/repository/models/product.dart';

class ApiService {
  Future<List<Category>> getCategories() async {
    String url = 'https://neobook.online/ecobak/product-category-list/';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));

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

  Future<List<Product>> getProductsByCategory(String categoryName) async {
    String url =
        'https://neobook.online/ecobak/product-list/?category_name=$categoryName';
    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));

        List<Product> products =
            responseData.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception(
            'Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<List<Product>> getProductsBySearch(
      TextEditingController controller, BuildContext context) async {
    String url =
        'https://neobook.online/ecobak/product-list/?search=${Uri.encodeComponent(controller.text)}&page=1&limit=50';
    print('API URL: $url');
    try {
      final response = await http.get(Uri.parse(url));
      print('API Response: ${response.body}');
      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));

        if (responseData is List) {
          List<Product> products =
              responseData.map((json) => Product.fromJson(json)).toList();
          return products;
        } else {
          throw Exception('Invalid API response format. Expected a List.');
        }
      } else {
        throw Exception(
            'Failed to fetch products. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

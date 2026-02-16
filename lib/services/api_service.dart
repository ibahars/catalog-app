import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String _baseUrl = 'https://wantapi.com/products.php';

  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);

        if (decodedData.containsKey('data')) {
          final List<dynamic> productsJson = decodedData['data'];

          return productsJson.map((item) => Product.fromJson(item)).toList();
        } else {
          return [];
        }
      } else {
        throw Exception("Sunucu hatası: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Hata Detayı: $e");
      return [];
    }
  }
}

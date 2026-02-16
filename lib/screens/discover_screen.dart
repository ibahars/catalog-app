import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> mockProducts = [
      Product(
        id: 1,
        name: "iPhone 13",
        price: 999.0,
        description: "Apple device",
        image: "https://via.placeholder.com/150",
        category: "Phone",
      ),
      Product(
        id: 2,
        name: "Laptop",
        price: 1500.0,
        description: "Power laptop",
        image: "https://via.placeholder.com/150",
        category: "Computer",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Discover",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: mockProducts.length,
              itemBuilder: (context, index) {
                final product = mockProducts[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}


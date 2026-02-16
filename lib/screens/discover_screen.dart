import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../services/api_service.dart';
import 'basket_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasketScreen()),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          }

          // Veri geldi ama liste boş mu?
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Ürünler yüklenemedi veya liste boş."),
            );
          }

          // Veri var, listele:
          final products = snapshot.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7, // Kart boyutu için biraz pay bırakalım
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
        },
      ),
    );
  }
}

import 'package:catalog_app/screens/basket_screen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;
import '../models/basket.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  void registerImage(String imageUrl, String viewId) {
    ui.platformViewRegistry.registerViewFactory(
      viewId,
      (int viewId) => html.ImageElement()
        ..src = imageUrl
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.objectFit = 'contain',
    );
  }

  @override
  Widget build(BuildContext context) {
    final String viewId = 'detail-img-${product.id}';
    registerImage(product.image, viewId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[100],
              child: HtmlElementView(key: UniqueKey(), viewType: viewId),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        BasketManager.addToBasket(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${product.name} added to basket!"),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: "GO TO BASKET",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BasketScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Add to Basket"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

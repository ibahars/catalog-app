import 'package:flutter/material.dart';
import '../models/basket.dart';
import 'dart:ui_web' as ui;
import 'dart:html' as html;

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  void registerBasketImage(String imageUrl, String viewId) {
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
    // Toplam fiyatı hesaplayalım
    double totalPrice = BasketManager.basketItems.fold(
      0,
      (sum, item) => sum + item.price,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Basket",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: BasketManager.basketItems.isEmpty
          ? const Center(child: Text("Your basket is empty!"))
          : Column(
              children: [
                // 1. Ürün Listesi
                Expanded(
                  child: ListView.builder(
                    itemCount: BasketManager.basketItems.length,
                    itemBuilder: (context, index) {
                      final item = BasketManager.basketItems[index];
                      final String viewId = 'basket-img-${item.id}-${index}';
                      registerBasketImage(item.image, viewId);

                      return ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: HtmlElementView(viewType: viewId),
                        ),
                        title: Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                      );
                    },
                  ),
                ),

                // 2. Sipariş Özeti ve Buton Alanı
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total:",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "\$${totalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              // Sipariş tamamlandığında bir uyarı gösterelim
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Success!"),
                                  content: const Text(
                                    "Your order has been placed successfully.",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("OK"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

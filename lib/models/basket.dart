import 'product.dart';

class BasketManager {
  static List<Product> basketItems = [];

  static void addToBasket(Product product) {
    basketItems.add(product);
  }
}
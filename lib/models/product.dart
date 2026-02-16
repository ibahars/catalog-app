class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String priceRaw = json['price'].toString();
    String priceCleaned = priceRaw.replaceAll('\$', '').replaceAll(',', '');
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(priceCleaned),
      image: json['image'],
      category: json['category'] ?? "Tech",
    );
  }
}

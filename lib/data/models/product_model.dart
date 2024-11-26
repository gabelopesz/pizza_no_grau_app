class Product {
  final int id;
  final String name;
  final String price;
  final String description;
  final bool isActive;
  final String? imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isActive,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      isActive: json['isActive'],
      imageUrl: json['imageUrl'],
    );
  }
}

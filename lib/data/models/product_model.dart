class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final bool isActive;
  final String? imageUrl;
  final String? category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isActive,
    this.imageUrl,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'isActive': isActive,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      isActive: json['isActive'],
      imageUrl: json['imageUrl'],
      category: json['category'],
    );
  }
}

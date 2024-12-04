import 'product_model.dart';

class Cart {
  List<CartItem> items = [];

  double get totalPrice {
    double total = 0.0;
    for (var item in items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void addProduct(Product product) {
    final existingItem = items.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    if (existingItem.quantity == 0) {
      items.add(existingItem);
    }
    existingItem.quantity++;
  }

  void removeProduct(Product product) {
    items.removeWhere((item) => item.product.id == product.id);
  }

  void updateQuantity(Product product, int quantity) {
    final existingItem =
        items.firstWhere((item) => item.product.id == product.id);
    if (existingItem != null) {
      existingItem.quantity = quantity;
    }
  }

  void clearCart() {
    items.clear();
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  static Cart fromJson(Map<String, dynamic> json) {
    final cart = Cart();
    if (json['items'] != null) {
      cart.items = (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList();
    }
    return cart;
  }
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  static CartItem fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}

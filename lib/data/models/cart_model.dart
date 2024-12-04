import 'product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

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
}

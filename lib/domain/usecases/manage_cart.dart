import '../../data/repositories/cart_repository.dart';
import '../../data/models/product_model.dart';
import '../../data/models/cart_model.dart';

class ManageCart {
  final CartRepository repository;

  ManageCart(this.repository);

  Future<void> addProductToCart(Product product) async {
    await repository.addProduct(product);
  }

  Future<void> removeProductFromCart(Product product) async {
    await repository.removeProduct(product);
  }

  Future<void> updateProductQuantity(Product product, int quantity) async {
    await repository.updateQuantity(product, quantity);
  }

  Future<void> clearCart() async {
    await repository.clearCart();
  }

  Future<Cart> getCart() async {
    return await repository.getCart();
  }
}

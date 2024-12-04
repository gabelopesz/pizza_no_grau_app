import '../datasources/product_api.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductApi _productApi = ProductApi();

  Future<List<Product>> fetchProducts() {
    return _productApi.fetchProducts();
  }
}

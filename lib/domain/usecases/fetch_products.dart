import '../../data/repositories/product_repository.dart';
import '../../data/models/product_model.dart';

class FetchProducts {
  final ProductRepository repository;

  FetchProducts(this.repository);

  Future<List<Product>> execute() {
    return repository.fetchProducts();
  }
}

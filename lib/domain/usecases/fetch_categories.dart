import '../../data/repositories/category_repository.dart';
import '../../data/models/category_model.dart';

class FetchCategories {
  final CategoryRepository repository;

  FetchCategories(this.repository);

  Future<List<Category>> execute() {
    return repository.fetchCategories();
  }
}

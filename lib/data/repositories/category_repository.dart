import '../datasources/category_api.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final CategoryApi _categoryApi = CategoryApi();

  Future<List<Category>> fetchCategories() {
    return _categoryApi.fetchCategories();
  }
}

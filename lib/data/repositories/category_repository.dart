import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/api_config.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final String _baseUrl = '${ApiConfig.baseUrl}/categories';

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception('Erro na API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao processar resposta da API: $e');
      return [];
    }
  }
}

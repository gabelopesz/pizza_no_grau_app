import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryRepository {
  final String _baseUrl = 'https://pizza-no-grau.free.beeceptor.com/categories';

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
      return []; // Retorna uma lista vazia se houver erro
    }
  }
}

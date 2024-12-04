import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/api_config.dart';
import '../models/product_model.dart';

class ProductRepository {
  final String _baseUrl = '${ApiConfig.baseUrl}/products';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Erro na API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao processar resposta da API: $e');
      return [];
    }
  }
}

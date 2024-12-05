import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/api_config.dart';
import '../models/order_model.dart';

class OrderApi {
  final String _baseUrl = '${ApiConfig.baseUrl}/orders';

  /// Cria um novo pedido enviando-o para a API.
  Future<Order> createOrder(Order order) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final jsonResponse = utf8.decode(response.bodyBytes);
        return Order.fromJson(jsonDecode(jsonResponse));
      } else {
        throw Exception(
            'Erro ao criar pedido: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      throw Exception('Erro de conexão ao criar pedido: $error');
    }
  }

  /// Obtém a lista de pedidos da API.
  Future<List<Order>> fetchOrders() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json; charset=utf-8'
        }, // Força o encoding UTF-8
      );

      if (response.statusCode == 200) {
        final jsonResponse = utf8.decode(response.bodyBytes);
        final List<dynamic> ordersJson = jsonDecode(jsonResponse);
        return ordersJson.map((json) => Order.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erro ao buscar pedidos: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      throw Exception('Erro de conexão ao buscar pedidos: $error');
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/api_config.dart';
import '../../data/models/address_model.dart';

class AddressApi {
  final String _baseUrl = '${ApiConfig.baseUrl}/address';

  Future<List<Address>> fetchAddresses() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Address.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar endereços');
    }
  }

  Future<Address> addAddress(Address address) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(address.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Address.fromJson(json.decode(response.body)['address']);
    } else {
      throw Exception('Erro ao adicionar endereço');
    }
  }

  Future<void> removeAddress(String id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao remover endereço');
    }
  }
}

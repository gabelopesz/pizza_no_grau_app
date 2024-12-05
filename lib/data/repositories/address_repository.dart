import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/address_model.dart';

class AddressRepository {
  static const _addressKey = 'addresses';

  Future<List<Address>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final addressJson = prefs.getStringList(_addressKey) ?? [];
    return addressJson
        .map((address) => Address.fromJson(jsonDecode(address)))
        .toList();
  }

  Future<void> addAddress(Address address) async {
    final prefs = await SharedPreferences.getInstance();
    final addresses = await getAddresses();
    addresses.add(address);
    await prefs.setStringList(_addressKey,
        addresses.map((address) => jsonEncode(address.toJson())).toList());
  }

  Future<void> removeAddress(String addressId) async {
    final prefs = await SharedPreferences.getInstance();
    final addresses = await getAddresses();
    addresses.removeWhere((address) => address.id == addressId);
    await prefs.setStringList(_addressKey,
        addresses.map((address) => jsonEncode(address.toJson())).toList());
  }
}

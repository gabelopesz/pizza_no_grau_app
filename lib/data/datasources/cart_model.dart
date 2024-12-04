import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';

class CartApi {
  static const _cartKey = 'cart';

  Future<Cart> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final cartMap = jsonDecode(cartJson);
      return Cart.fromJson(cartMap);
    }
    return Cart();
  }

  Future<void> saveCart(Cart cart) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(cart.toJson());
    await prefs.setString(_cartKey, cartJson);
  }
}

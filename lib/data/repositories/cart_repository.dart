import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartRepository {
  static const _cartKey = 'cart'; // Definindo a chave para armazenar o carrinho

  // Método assíncrono para carregar o carrinho
  Future<Cart> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(_cartKey);
    if (cartJson != null) {
      final cartMap = jsonDecode(cartJson);
      return Cart.fromJson(cartMap); // Carregue o carrinho a partir do JSON
    }
    return Cart(); // Se não encontrar, retorna um carrinho vazio
  }

  // Método assíncrono para salvar o carrinho
  Future<void> saveCart(Cart cart) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(cart.toJson());
    await prefs.setString(_cartKey, cartJson); // Salva o carrinho
  }

  // Método para adicionar produto ao carrinho (agora assíncrono)
  Future<void> addProduct(Product product) async {
    final cart = await getCart(); // Aguarda o carrinho ser carregado
    cart.addProduct(product);
    await saveCart(cart); // Aguarda o carrinho ser salvo
  }

  // Método para remover produto do carrinho (agora assíncrono)
  Future<void> removeProduct(Product product) async {
    final cart = await getCart(); // Aguarda o carrinho ser carregado
    cart.removeProduct(product);
    await saveCart(cart); // Aguarda o carrinho ser salvo
  }

  // Método para atualizar a quantidade de um produto (agora assíncrono)
  Future<void> updateQuantity(Product product, int quantity) async {
    final cart = await getCart(); // Aguarda o carrinho ser carregado
    cart.updateQuantity(product, quantity);
    await saveCart(cart); // Aguarda o carrinho ser salvo
  }

  // Método para limpar o carrinho (agora assíncrono)
  Future<void> clearCart() async {
    final cart = await getCart(); // Aguarda o carrinho ser carregado
    cart.clearCart();
    await saveCart(cart); // Aguarda o carrinho ser salvo
  }
}

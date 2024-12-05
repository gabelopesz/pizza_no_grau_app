import '../datasources/order_api.dart';
import '../models/order_model.dart';
import '../models/cart_model.dart';

class OrderRepository {
  final OrderApi orderApi;

  OrderRepository(this.orderApi);

  /// Obter a lista de pedidos
  Future<List<Order>> getOrders() async {
    try {
      return await orderApi.fetchOrders();
    } catch (error) {
      throw Exception('Erro ao obter pedidos: $error');
    }
  }

  /// Criar um novo pedido
  Future<Order> createOrder(Order order) async {
    try {
      return await orderApi.createOrder(order);
    } catch (error) {
      throw Exception('Erro ao criar pedido: $error');
    }
  }

  /// Finalizar um pedido a partir do carrinho
  Future<Order> finalizeOrder({
    required Cart cart,
    required String addressId,
    required String paymentMethod,
  }) async {
    // Cria o pedido com base nos dados do carrinho
    final order = Order(
      id: '', // O ID será gerado pela API
      date: DateTime.now().toIso8601String(),
      status: 'Em preparação',
      total: cart.totalPrice,
      addressId: addressId,
      paymentMethod: paymentMethod,
    );

    try {
      return await createOrder(order);
    } catch (error) {
      throw Exception('Erro ao finalizar pedido: $error');
    }
  }
}

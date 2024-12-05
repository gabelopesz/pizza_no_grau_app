import '../../data/repositories/order_repository.dart';
import '../../data/models/order_model.dart';

class CreateOrder {
  final OrderRepository repository;

  CreateOrder(this.repository);

  Future<Order> call(Order order) async {
    return await repository.createOrder(order);
  }
}

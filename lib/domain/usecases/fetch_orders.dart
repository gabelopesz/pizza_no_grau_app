import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';

class FetchOrders {
  final OrderRepository repository;

  FetchOrders(this.repository);

  Future<List<Order>> call() async {
    return await repository.getOrders();
  }
}

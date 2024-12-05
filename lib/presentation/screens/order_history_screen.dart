import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/datasources/order_api.dart';
import '../../domain/usecases/fetch_orders.dart';
import '../themes/my_colors.dart';
import '../widgets/bottom_navigation_bar.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late FetchOrders _fetchOrders;
  late Future<List<Order>> _ordersFuture;
  List<Order> _orders = []; // Lista de pedidos local para atualização dinâmica
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    final orderApi = OrderApi();
    final orderRepository = OrderRepository(orderApi);
    _fetchOrders = FetchOrders(orderRepository);
    _loadOrders(); // Carrega os pedidos ao iniciar
  }

  /// Carrega os pedidos da API
  void _loadOrders() {
    _ordersFuture = _fetchOrders();
    _ordersFuture.then((orders) {
      setState(() {
        _orders = orders;
      });
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar pedidos: $error')),
      );
    });
  }

  /// Adiciona um novo pedido ao histórico
  void _addOrder(Order newOrder) {
    setState(() {
      _orders.insert(0, newOrder); // Adiciona o novo pedido no início da lista
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/menu_screen');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/cart');
    } else if (index == 2) {
      // Permanecer na mesma tela
    }
  }

  @override
  Widget build(BuildContext context) {
    // Verifica se há um novo pedido recebido como argumento
    final newOrder = ModalRoute.of(context)?.settings.arguments as Order?;
    if (newOrder != null) {
      _addOrder(newOrder);
    }

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: const Text('Histórico de Pedidos'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Order>>(
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              _orders.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError && _orders.isEmpty) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (_orders.isEmpty) {
            return const Center(child: Text('Nenhum pedido encontrado.'));
          } else {
            return ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                final order = _orders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: MyColors.redPrimary,
                              child: const Icon(
                                FontAwesomeIcons.pizzaSlice,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('PEDIDO ${order.id}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(order.date),
                                const SizedBox(height: 5),
                                Text(order.status,
                                    style: TextStyle(
                                        color: _getStatusColor(order.status))),
                              ],
                            ),
                            const Spacer(),
                            Text('R\$ ${order.total.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Em preparação":
        return Colors.orange;
      case "A caminho":
        return Colors.blue;
      case "Cancelado":
        return Colors.red;
      case "Finalizado":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

import 'package:flutter/material.dart';
import '../../data/models/cart_model.dart';
import '../../domain/usecases/manage_cart.dart';
import '../../data/repositories/cart_repository.dart';
import '../widgets/base_scaffold.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final ManageCart _manageCart;
  late Future<Cart> _cartFuture;
  int _selectedIndex = 1; // O índice do Carrinho

  @override
  void initState() {
    super.initState();
    _manageCart = ManageCart(CartRepository());
    _cartFuture = _manageCart.getCart();
  }

  // Função para finalizar o pedido
  void _finalizeOrder() async {
    await _manageCart.clearCart();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pedido finalizado com sucesso!')),
      );
    }
  }

  // Função de navegação do BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/menu_screen');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/cart');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/order-history');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Carrinho de Compras',
      selectedIndex: _selectedIndex, // Passando o selectedIndex
      onItemTapped: _onItemTapped, // Passando a função de navegação
      body: FutureBuilder<Cart>(
        future: _cartFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Erro ao carregar carrinho: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.items.isEmpty) {
            return const Center(child: Text('Seu carrinho está vazio'));
          } else {
            final cart = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return ListTile(
                        title: Text(item.product.name),
                        subtitle: Text(
                            'Preço: R\$ ${item.product.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () async {
                                if (item.quantity > 1) {
                                  await _manageCart.updateProductQuantity(
                                      item.product, item.quantity - 1);
                                } else {
                                  await _manageCart
                                      .removeProductFromCart(item.product);
                                }
                                setState(() {
                                  _cartFuture = _manageCart
                                      .getCart(); // Atualiza o carrinho
                                });
                              },
                            ),
                            Text(item.quantity.toString()),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () async {
                                await _manageCart.updateProductQuantity(
                                    item.product, item.quantity + 1);
                                setState(() {
                                  _cartFuture = _manageCart
                                      .getCart(); // Atualiza o carrinho
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed:
                        _finalizeOrder, // Chama a função de finalizar pedido
                    child: const Text('Fechar Pedido'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE9524D), // Cor do botão
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

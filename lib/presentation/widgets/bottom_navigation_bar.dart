import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../themes/my_colors.dart';
import '../screens/menu_screen.dart'; // Importe sua tela MenuScreen
import '../screens/cart_screen.dart'; // Importe sua tela CartScreen
import '../screens/order_history_screen.dart'; // Importe sua tela OrderHistoryScreen

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColors.redPrimary,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        onItemTapped(index);
        // Defina a navegação para a tela correta ao clicar em um item
        switch (index) {
          case 0: // Home
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MenuScreen()));
            break;
          case 1: // Carrinho
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
            break;
          case 2: // Pedidos (Histórico)
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => OrderHistoryScreen()));
            break;
          case 3: // Pedidos (Sacola)
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        OrderHistoryScreen())); // Aqui vai o link para a tela de pedidos
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Carrinho',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons
              .history), // Usando ícone de histórico para pedidos
          label: 'Pedidos', // Mudado o nome para "Pedidos"
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.shoppingBag), // Ícone de sacola
          label: 'Pedidos', // Nome alterado para 'Pedidos'
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../themes/my_colors.dart';

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
        onItemTapped(index); // Navegação feita pela função de navegação
        if (index == 0) {
          Navigator.pushNamed(context, '/menu_screen');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/cart');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/order-history');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/address');
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
          icon: Icon(FontAwesomeIcons.history),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.addressCard),
          label: 'Endereços', // Alterado para Endereços
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../themes/my_colors.dart';
import '../routes.dart';

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

        // Rotas ao clicar em um item
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoutes.menuScreen);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.cartScreen);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoutes.orderHistoryScreen);
            break;
          case 3: // Endereços
            Navigator.pushNamed(context, AppRoutes.addressScreen);
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
          icon: Icon(FontAwesomeIcons.history),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.mapMarkerAlt), // Ícone para endereços
          label: 'Endereços',
        ),
      ],
    );
  }
}

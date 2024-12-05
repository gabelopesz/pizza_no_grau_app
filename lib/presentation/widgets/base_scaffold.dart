import 'package:flutter/material.dart';
import '../widgets/bottom_navigation_bar.dart'; // Certifique-se de importar o BottomNavigationBar

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final int selectedIndex;
  final Function(int) onItemTapped; // Função para navegação

  const BaseScaffold({
    Key? key,
    required this.body,
    required this.title,
    required this.selectedIndex,
    required this.onItemTapped, // Passando a função de navegação
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex, // Passando o selectedIndex
        onItemTapped: onItemTapped, // Passando a função onItemTapped
      ),
    );
  }
}

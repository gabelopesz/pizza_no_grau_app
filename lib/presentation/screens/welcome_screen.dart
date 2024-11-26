import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(
        child: Image.asset(
          'lib/assets/images/Logo.png',
          width: MediaQuery.of(context).size.width *
              1.2, // Responsivo - 60% da largura da tela
          height: MediaQuery.of(context).size.width *
              1.2, // Mantém proporção similar à largura
          fit: BoxFit.contain, // Ajusta a imagem sem cortar
        ),
      ),
    );
  }
}

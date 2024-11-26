import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart';
import 'home_screen.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo centralizada
            Image.asset(
              'lib/assets/images/Logo.png',
              width: MediaQuery.of(context).size.width *
                  1.2, // Responsivo - 60% da largura da tela
              height: MediaQuery.of(context).size.width *
                  1.2, // Mantém proporção similar à largura
              fit: BoxFit.contain, // Ajusta a imagem sem cortar
            ),
            SizedBox(height: 40), // Espaço entre a logo e o botão
          ],
        ),
      ),
      // Botão pequeno e redondo para redirecionar à tela inicial
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Redireciona para a HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        backgroundColor:
            MyColors.redPrimary, // Cor vermelha definida em MyColors
        child: Icon(
          Icons.arrow_forward, // Ícone de seta para frente
          color: MyColors.background, // Cor branca do ícone
        ),
      ),
    );
  }
}

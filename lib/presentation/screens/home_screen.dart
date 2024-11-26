import 'package:flutter/material.dart';
import '../themes/my_colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza no Grau',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtendo o tamanho da tela
    double screenWidth = MediaQuery.of(context).size.width;

    // Definindo a largura dos botões como 80% da largura da tela
    double buttonWidth = screenWidth * 0.8;

    return Scaffold(
      backgroundColor: MyColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0), // Adicionando margem nas laterais
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo da Pizza no Grau
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                    'lib/assets/images/Logo.png'), // Logo da Pizza no Grau
              ),
              // Botões de Login e Cadastro
              SizedBox(height: 40),
              Container(
                width: buttonWidth, // Largura responsiva para o botão
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.redPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'ENTRAR',
                    style: TextStyle(
                      color: MyColors.background,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: buttonWidth, // Largura responsiva para o botão
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.redPrimary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'CADASTRAR',
                    style: TextStyle(
                      color: MyColors.background,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'presentation/routes.dart'; // Importando o arquivo de rotas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza no Grau',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginScreen, // Iniciar na tela de login
      onGenerateRoute: AppRoutes.generateRoute, // Usando a função de rotas
    );
  }
}

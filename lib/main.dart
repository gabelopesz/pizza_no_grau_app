import 'package:flutter/material.dart';
import 'presentation/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: AppRoutes.menuScreen, // Definindo a tela inicial como Menu
      onGenerateRoute:
          AppRoutes.generateRoute, // Usando a função para gerar as rotas
    );
  }
}

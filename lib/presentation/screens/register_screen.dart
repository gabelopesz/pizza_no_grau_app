import 'package:flutter/material.dart';
import 'package:pizza_no_grau_app/presentation/themes/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_screen.dart'; // Importe a tela de carrinho

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureText = true; // Controla se a senha está oculta

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: Text('Cadastrar', style: TextStyle(color: MyColors.grayText)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24.0), // Margem lateral
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              // Título da tela
              Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: MyColors.grayText, // Cor do título
                ),
              ),
              SizedBox(height: 40), // Distância ajustada entre título e campos

              // Campo de Nome
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
              ),
              SizedBox(height: 12), // Espaçamento ajustado

              // Campo de E-mail
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 12),

              // Campo de Senha
              TextField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: MyColors.grayText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Campo de Confirmar Senha
              TextField(
                controller: confirmPasswordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: MyColors.grayText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: 20), // Distância ajustada entre o campo e o botão

              // Botão Cadastrar
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.redPrimary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  minimumSize: Size(double.infinity, 50), // Botão responsivo
                ),
                child: Text(
                  'CADASTRAR',
                  style: TextStyle(
                      color: MyColors.background,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height:
                      12), // Distância reduzida entre o botão e o link de login

              // Texto de navegação para o login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Já tem conta?'),
                  TextButton(
                    onPressed: () {
                      // Navegação para a tela de login
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Entre',
                        style: TextStyle(color: MyColors.redPrimary)),
                  ),
                ],
              ),
              SizedBox(
                  height:
                      24), // Distância entre o link e os ícones de redes sociais

              // Ícones de redes sociais
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.facebook),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.blueAccent,
                    onPressed: () {},
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.google),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Botão flutuante para redirecionar para a tela do carrinho
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Redireciona para a tela de carrinho
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        },
        backgroundColor: MyColors.redPrimary, // Cor do botão
        child: Icon(
          Icons.arrow_forward, // Ícone de seta
          color: MyColors.background, // Cor do ícone (branco)
        ),
      ),
    );
  }
}
